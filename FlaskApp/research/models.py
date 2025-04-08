from research import db, login_manager
from datetime import datetime
from flask_login import UserMixin # needed to inherit is_authenticated, is_active, etc for login manager


################################################ Get user ID for Login Manager Objects #############################3

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


################################################ Database ############################################################

# database table for the user, check the User key, task counter, and overall completion

class User(db.Model, UserMixin):

    id = db.Column(db.Integer, primary_key = True);
    key = db.Column(db.String(32), unique = True, nullable = False)

    # track start and end time and later check if all of it was finished within 2 hours.
    # otherwise leave the invalid flag as it is
    startTime = db.Column(db.DateTime, default = datetime.utcnow)
    endTime = db.Column(db.DateTime)

    responseCounter = db.Column(db.Integer, unique = False, default = 1, nullable = False)

    response4 = db.Column(db.String(32), unique = False, default=0)
    response5 = db.Column(db.String(32), unique = False, default=0)

    def __repr__(self):
        return f"User('{self.key}','{self.startTime}', '{self.responseCounter}','{self.endTime}','{self.response4}','{self.response5}')"
