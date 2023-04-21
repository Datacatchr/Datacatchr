from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager


app = Flask(__name__)
app.config['SECRET_KEY'] = 'fb690186cc5961334330d02cffe9d8f2a770622451310a3fb7ab2949e73af0f6'
 #to create the db, go to the appropriate directory, open the python REPL, run: 
# from datacatchr2 import db, app
# app.app_context().push()
# db.create_all()
# To add something to the database
# some_var = SomeDataClass(attr1='x',attr2='y'...)
# db.session.add(some_varuser)
# Then it needs to be committed to the db
# db.session.commit()
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db' #three slashes means relative path from current file so it should get created in our project directory
db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
login_manager.login_view = 'login'
login_manager.login_message_category = 'info'


from datacatchr2 import routes

 
