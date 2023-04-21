from datetime import datetime
from datacatchr2 import db, login_manager
from flask_login import UserMixin
from random import randint


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class Tool(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    tool_name = db.Column(db.String(120), nullable=False)
    tool_description = db.Column(db.String(240), unique=True, nullable=False)
    downloads = db.Column(db.String(240), nullable=False)
    last_used = db.Column(db.String(240), nullable=False)
    suggested_by = db.Column(db.String(240), nullable=False)
    created_by = db.Column(db.String(240), nullable=False)
    template = db.Column(db.String(240), nullable=False)

    def __repr__(self):
        return f"User('{self.tool_name}', '{self.tool_description}', '{self.created_by}')"
    
class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    image_file = db.Column(db.String(20), nullable=False, default='default.jpg')
    password = db.Column(db.String(60), nullable=False)
    # tools = db.relationship('Tool', backref='creator', lazy=True)

    def __repr__(self):
        return f"User('{self.username}', '{self.email}', '{self.image_file}')"

# class Post(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     title = db.Column(db.String(100), nullable=False)
#     date_posted = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
#     content = db.Column(db.Text, nullable=False)
#     user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

#     def __repr__(self):
#         return f"Post('{self.title}', '{self.date_posted}')"
    
# This class is used for creating the table and adding rows, amongst other things
class Create_data_app_db (db.Model):
    # __tablename__ = 'create_data_app_db'
    id = db.Column(db.String,  primary_key=True)
    the_one_thing = db.Column(db.String)
    area_dd = db.Column(db.String)
    topic_dd = db.Column(db.String)
    start_time = db.Column(db.String)
    end_time = db.Column(db.String)
    timer_secs = db.Column(db.String)
    timer_tens_of_secs = db.Column(db.String)
    focus_dd = db.Column(db.String)
    work_descript = db.Column(db.String)

    def __init__(self, id, the_one_thing, area_dd, topic_dd, start_time, end_time, timer_secs, timer_tens_of_secs, focus_dd, work_descript):
        self.id = randint(0, 1000000)
        self.the_one_thing = the_one_thing
        self.area_dd = area_dd
        self.topic_dd = topic_dd
        self.start_time = start_time
        self.end_time = end_time
        self.timer_secs = timer_secs
        self.timer_tens_of_secs = timer_tens_of_secs
        self.focus_dd = focus_dd
        self.work_descript = work_descript