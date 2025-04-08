from flask import Flask
from flask_sqlalchemy import SQLAlchemy # DBMS
import os
from flask_login import LoginManager # tracking authed users


################################################ Config ############################################################

homedir = "/Users/avinash/Desktop/LLMEyeGazeDataCollection"
app = Flask(__name__)
app.config['SECRET_KEY'] = '5791628bb0b13ce0c676dfde280ba245' # encoding
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///auth.db' # path to the dbms
app.config['MAX_CONTENT_LENGTH'] = 32 * 1024 * 1024 # POST route size limit 32Mb. Can also add decorators, but they'll be redundant.
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False # https://stackoverflow.com/questions/33738467/how-do-i-know-if-i-can-disable-sqlalchemy-track-modifications
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = homedir + "/turkerapp-0d008c684f30.json"

print(homedir)


# SQLAlchemy setup
db = SQLAlchemy(app)

# login manager to keep users logged in
login_manager = LoginManager(app)
login_manager.login_view = 'login'
login_manager.login_message_category = 'info'


# these have to be imported after the app is initialized
# in order to avoid circular imports
from research import routes
