from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, TextAreaField, RadioField
from wtforms.validators import DataRequired, Length, EqualTo



# Form to take in the generated, unique hash key, the key is later used as the primary key for the database
class KeyForm(FlaskForm):
    key = StringField('Enter the User Key into the field below:',
                        validators=[DataRequired(), Length(min = 31, max = 33)])
    submit = SubmitField('Start the test')






class GDSForm(FlaskForm):

    ##### GDS Stanford test https://web.stanford.edu/~yesavage/GDS.english.short.score.html ########
    q1 = RadioField('1. Are you basically satisfied with your life?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q2 = RadioField('2. Have you dropped many of your activities and interests?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q3 = RadioField('3. Do you feel that your life is empty?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q4 = RadioField('4. Do you often get bored?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q5 = RadioField('5. Are you in good spirits most of the time?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q6 = RadioField('6. Are you afraid that something bad is going to happen to you? ', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q7 = RadioField('7. Do you feel happy most of the time? ', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q8 = RadioField('8. Do you often feel helpless? ', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q9 = RadioField('9. Do you prefer to stay at home, rather than going out and doing new things?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q10 = RadioField('10. Do you feel you have more problems with memory than most?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q11 = RadioField('11. Do you think it is wonderful to be alive now?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q12 = RadioField('12. Do you feel pretty worthless the way you are now?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q13 = RadioField('13. Do you feel full of energy?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q14 = RadioField('14. Do you feel that your situation is hopeless?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    q15 = RadioField('15. Do you think that most people are better off than you are?', choices=[(1,'Yes'),(0,'No')],  validators=[DataRequired()] )
    ##################################################################################################
    submit = SubmitField('Continue')




class PHQForm(FlaskForm):

    ##### PHQ test https://sleepdata.org/datasets/bestair/files/m/browser/forms/BestAIR_Patient_Health_Questionnaire_(PHQ-8).pdf?inline=1########
    q1 = RadioField('1. Little interest or pleasure in doing things',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q2 = RadioField('2. Feeling down, depressed, or hopeless ',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q3 = RadioField('3. Trouble falling or staying asleep, or sleeping too much ',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q4 = RadioField('4. Feeling tired or having little energy',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q5 = RadioField('5. Poor appetite or overeating',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q6 = RadioField('6. Feeling bad about yourself — or that you are a failure or have let yourself or your family down',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q7 = RadioField('7. Trouble concentrating on things, such as reading the newspaper or watching television',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    q8 = RadioField('8. Moving or speaking so slowly that other people could have noticed. Or the opposite – being so fidgety or restless that you have been moving around a lot more than usual',\
         choices=[(0,'Not at All'), (1,'Several Days'), (2,'More than half the days'),(3,'Nearly every day')],  validators=[DataRequired()] )
    ################################################################################################
    submit = SubmitField('Submit')
