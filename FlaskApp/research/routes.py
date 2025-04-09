################################################ Website Routes ############################################################

from flask import render_template, url_for, flash, redirect, request, abort
from research import app, db
from research.forms import KeyForm, GDSForm, PHQForm
from research.models import User
from datetime import datetime
import secrets # used for a 32 hex
import sqlite3

from research.speech_recog_func import *

from flask_login import login_user, current_user, logout_user, login_required # keep user logged in for the test


homedir = "/Users/avinash/Desktop/LLMEyeGazeDataCollection/FlaskApp"


############### Min size check #################
# from functools import wraps

# # this is a wrapper function that controls for the size of the file
# # it cam be later modified to set the max size too, but so far I set
# # the max size globally
# def limit_content_length(min_length):
#     def decorator(f):
#         @wraps(f)
#         def wrapper(*args, **kwargs):
#             cl = request.content_length
#             if cl is not None and cl < min_length:
#                 abort(413)
#             return f(*args, **kwargs)
#         return wrapper
#     return decorator
#    Wrapper is a little redundant so I just added a function for each route


###################  Home route #####################

@app.route("/")
@app.route("/home")
def home():
    '''
    args:
    action: home route
    '''
    if current_user.is_authenticated:
        return render_template('authhome.html')
    return render_template('home.html')



############  Terms and Conditions Route ################

@app.route("/termsandconditions")
def termsandconditions():
    '''
    args:
    action: asking the user to sign the Terms & Conditions agreement
    '''
    if current_user.is_authenticated:
        flash('You have already agreed with Terms & Conditions! You may start the test now!', 'success')
        return redirect(url_for('home'))

    return render_template('termsandconditions.html', title='Consent Form')


############  Generating User Keys Route ################

@app.route("/generatekey")
def generatekey():
    '''
    args:
    action: generating a random yet unique 16hex hash and assigning it to users
    '''
    if current_user.is_authenticated:
        flash('You are already logged in! You can start the Speech Test by following the link in the Navigation Bar!', 'success')
        return redirect(url_for('home'))

    # generating User key and adding it to the database, the key is 32 chars
    key = secrets.token_hex(16)

    # check if the key already exists, if it does try again
    u = User.query.filter_by(key=key).first()
    while u:
        key = secrets.token_hex(16)
        u = User.query.filter_by(key=key).first()

    # add the key to the DBMS and let User users start the test
    user = User(key=key)
    db.session.add(user)
    db.session.commit()


    return render_template('generatekey.html', title='Generate Key', key = key)


############  Auth Route ################

@app.route("/login", methods=['GET', 'POST'])
def login():
    '''
    args: POST: 16hash
    action: login route. Checks login creds against the database
    '''
    if current_user.is_authenticated:
        flash('You are already logged in!', 'success')
        return redirect(url_for('home'))

    form = KeyForm()
    if form.validate_on_submit():
        user = User.query.filter_by(key = form.key.data).first()
        if user:
            login_user(user, remember = True)
            return redirect(url_for('response1'))
        else:
            flash('Login Unsuccessful. Please try again or get a new key!', 'danger')
    return render_template('login.html', title='Login', form=form)






############  Logout Route ################

@app.route("/logout")
def logout():
    '''
    args: current_user.key
    action: logout
    '''
    logout_user()
    return redirect(url_for('home'))


############ Speech Route ################

@app.route("/response1", methods=['POST', 'GET'])
@login_required
# @limit_content_length(60000 * 1024) # have at least 600kb input size
def response1():
    '''
    args: POST: audio wav file --> ./response1
    action: check for responseCounters enabled
            googleSpeechAPI disabled for now
            size check at least 500kb (supposed to be way more than that though)
            global size check: no more than 32Mb
    '''
    if (request.method == "POST") and (current_user.responseCounter == 1 ):

        #Cheat checker
        cl = request.content_length
        if cl < 100 * 1024: # defining the minimal file size as 500kb
            current_user.responseCounter = 9 # 9 is a fail counter
            db.session.commit()
            return "402"


        # opening the XML route for posting
        f = request.files['audio_data']
        with open(homedir + '/data/response1/' + current_user.key+'.wav', 'wb') as audio:
            f.save(audio)
        current_user.responseCounter = 2
        db.session.commit()


        # Google speech API
        # transcribing the voice and creating a hash map to run fast queries on it


        hypothesis = "If you're reading this right now I want you to know that the fingerprints of a koala are so indistinguishable from humans that they have on occasion been confused at a crime scene"


        transcript = totext( current_user.key )
        if not transcript:
            return "402"
        transcript = transcript.split()
        if transcript and len( transcript ) > 10 and len( transcript ) < 65: # if the user did not say enough OR said too much, save time by not doing DP
            # Calculate WER with Levenshtein distance
            transcript_error = wer( transcript, hypothesis.split() )
        else:
            current_user.responseCounter = 9 # 9 is a fail counter
            db.session.commit()
            return "402" # discard the poor quality/indistinguishable speech



        # len(hypothesis) = 34
        # since there are some words difficult for the API to pick up
        # ex.: "indistinguishable", "koala", etc
        # let's set the WER threshold to 50%
        # hence, 34*50% = 17
        if transcript_error > 70:
            current_user.responseCounter = 9 # 9 is a fail counter
            db.session.commit()
            return "402" # discard the poor quality/indistinguishable speech

        # end anti-cheat

        return "202" # 202 file recieved successfully

    else:
        if current_user.responseCounter == 1: # check if the user has previously submitted any audio
            return render_template('response1.html', title='Speech Processing')
        elif current_user.responseCounter == 9:
            flash('You failed one of the tests! You cannot continue!', 'danger')
            return redirect(url_for('home')) # TODO: add a fail route
        else:
            flash('Do the tests in order. Resumbissions are not allowed!', 'danger')
            return redirect(url_for('home'))


@app.route("/expertresponse", methods=['GET'])
def expertresponse():
      # No login check, no responseCounter check
      return render_template('expertresponse.html', title='Speech Analysis')

@app.route("/noviceresponse", methods=['GET'])
def noviceresponse():
      # No login check, no responseCounter check
      return render_template('noviceresponse.html', title='Speech Analysis')





############ Personal Question Route ################

@app.route("/response2", methods=['POST', 'GET'])
@login_required
# @limit_content_length(3 * 1024)
def response2():
    if request.method == "POST" and (current_user.responseCounter == 2 ):

        #Cheat checker
        cl = request.content_length
        if cl < 300 * 1024: # defining the minimal file size as 500kb
            current_user.responseCounter = 9 # 9 is a fail counter
            db.session.commit()
            return "402"

        # end anti-cheat

        f = request.files['audio_data']
        with open(homedir + '/data/response2/' + current_user.key+'.wav', 'wb') as audio:
            f.save(audio)

        current_user.responseCounter = 3
        db.session.commit()

        return "202"
    else:
        if current_user.responseCounter == 2: # check if audio is here already
            return render_template('response2.html', title='Personal Question')
        elif current_user.responseCounter == 9:
            flash('You failed one of the tests! You cannot continue!', 'danger')
            return redirect(url_for('home')) # TODO: add a fail route
        else:
            flash('Do the tests in order. Resumbissions are not allowed!', 'danger')
            return redirect(url_for('home'))



############ Image Description Route ################

@app.route("/response3", methods=['POST', 'GET'])
@login_required
# @limit_content_length(3 * 1024)
def response3():
    if request.method == "POST" and (current_user.responseCounter == 3 ):

        #Cheat checker
        cl = request.content_length
        if cl < 300 * 1024: # defining the minimal file size as 500kb
            current_user.responseCounter = 9 # 9 is a fail counter
            db.session.commit()
            return "402"
        # end anti-cheat


        f = request.files['audio_data']
        with open(homedir + '/data/response3/' + current_user.key+'.wav', 'wb') as audio:
            f.save(audio)

        current_user.responseCounter = 4
        db.session.commit()
        return "202"
    else:
        if current_user.responseCounter == 3: # check if audio is here already
            return render_template('response3.html', title='Image Description')
        elif current_user.responseCounter == 9:
            flash('You failed one of the tests! You cannot continue!', 'danger')
            return redirect(url_for('home')) # TODO: add a fail route
        else:
            flash('Do the tests in order. Resumbissions are not allowed!', 'danger')
            return redirect(url_for('home'))


############ GDS Questionnaire Route ################

@app.route("/response4", methods=['POST', 'GET'])
@login_required
def response4():

    form = GDSForm()
    if form.validate_on_submit():
        if form.q1.data:
            #### Getting the GDS form data
            cnt = 0
            userResponses = "";
            for i in form:
                if cnt < 15:
                    userResponses += i.data
                cnt+=1
            current_user.response4 = userResponses;
            current_user.responseCounter = 5
            db.session.commit()

            return redirect(url_for('response5'))
        else:
            flash('Submission error!', 'danger')

    # check for the right test order
    if current_user.responseCounter == 4:
        return render_template('response4.html', title='GDS Questionnaire', form=form)
    elif current_user.responseCounter == 9:
            flash('You failed one of the tests! You cannot continue!', 'danger')
            return redirect(url_for('home')) # TODO: add a fail route
    else:
        flash('Do the tests in order. Resumbissions are not allowed!', 'danger')
        return redirect(url_for('home'))


############ PHQ Questionnaire Route ################

@app.route("/response5", methods=['POST', 'GET'])
@login_required
def response5():
    form = PHQForm()
    if form.validate_on_submit():
        if form.q1.data:
            #### Getting the PHQ8 form data
            cnt = 0
            userResponses = "";
            for i in form:
                if cnt < 8:
                    userResponses += i.data
                cnt+=1
            flash('You have completed the Questionaire!', 'success')

            #saving PHQ 8 respones
            current_user.response5 = userResponses

            # saving the endTime
            current_user.endTime = datetime.utcnow()

            # Timeframe check
            # give users 20 minutes to complete the test
            duration = current_user.endTime - current_user.startTime
            if duration.total_seconds() > 20*60:
                flash('You took too long to complete the test! Unfortunately, your results are discarded', 'danger')
                current_user.responseCounter = 9
                db.session.commit()
                return redirect(url_for('completed'))

            current_user.responseCounter = 6
            db.session.commit()

            return redirect(url_for('completed'))
        else:
            flash('Submission error!', 'danger')
    if current_user.responseCounter == 5:
        return render_template('response5.html', title='PHQ Questionaire', form=form)
    elif current_user.responseCounter == 9:
            flash('You failed one of the tests or you exceeded your 20 minute available interval! You cannot continue!', 'danger')
            return redirect(url_for('home')) # TODO: add a fail route
    else:
        flash('Do the tests in order. Resumbissions are not allowed!', 'danger')
        return redirect(url_for('home'))


############ Finished Route ################


@app.route("/completed")
def completed():
    if current_user.responseCounter == 6:
        return render_template('completed.html')
    else:
        flash('Do the tests in order. Resumbissions are not allowed!', 'danger')
        return redirect(url_for('home'))


############ IP Post Route ################

@app.route('/post', methods=['POST'])
def post():
    try:
        if request.method == 'POST':
            content = request.get_json()
            ip = content['query']
            city = content['city']
            country = content['country']
            lat = content['lat']
            lon = content['lon']
            browser = content['browser']
            with sqlite3.connect(homedir + '/data/ip_specs.db') as con:
                cur = con.cursor()
                cur.execute("INSERT INTO client (ip, city, country, lat, lon, browser) VALUES (?, ?, ?, ?, ?, ?)",
                            (ip, city, country, lat, lon, browser))
                con.commit()
                msg = "Record successfully added"
    except:
        con.rollback()
        msg = "ERROR in insert operation!!"
        print(msg)
        #XXX: use logs for debugging

    finally:
        #con.close()
        return msg




