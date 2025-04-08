import sys
import logging 
logging.basicConfig(stream=sys.stderr) 
sys.path.insert(0,"/home/ubuntu/FlaskApp/")

from research import app as application
