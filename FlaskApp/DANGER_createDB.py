# Dangerous!! It drops the database
# Delete the script once its created
# XXX: may add a check for exisitng files
from research import db
from research.models import User
db.drop_all()
db.create_all()



