import secrets
import os
from PIL import Image
from datacatchr2.models import User, Create_data_app_db
from datacatchr2 import app, db, bcrypt
from flask import Flask, render_template, url_for, flash, redirect, request
from datacatchr2.forms import RegistrationForm, LoginForm, UpdateAccountForm
from flask_login import login_user, current_user, logout_user, login_required
from os import system
import os
from sqlalchemy.inspection import inspect
from random import randint

# These will show up on the homescreen and link to the forms to capture data
capture_tools = [
    {
    'name':'Time Log',
     'description':'A rich time log for tracking time spent towards a goal',
     'last_used': '',
     'suggested_by':'trmulher',
     'built_by':'trmulher'
     },
   { 
    'name':'Routine Tracker',
    'description':'A routine tracker that captures rich data around a set of actions. Not Built Yet.',
    'last_used': '',
    'suggested_by':'trmulher', 
    'built_by':'trmulher'
    },
    {
    'name':'Alarm',
    'description':'An alarm clock that lets you track how often you hit snooze. Not Built Yet.',
    'last_used': '',
    'suggested_by':'CCoppola',
    'built_by':'trmulher'
    },
    {
    'name':'Job Application Tracker',
    'description':'Keep track of your job hunt process. Not Built Yet.',
    'last_used': '',
    'suggested_by':'trmulher',
    'built_by':'trmulher'
    },
    {
    'name':'Discomfort Streak Tracker',
    'description':'Keep track of your efforts to seek discomfort in pursuit of personal development. Not Built Yet.',
    'last_used': '',
    'suggested_by':'trmulher',
    'built_by':'trmulher'
    }
    ]

# This is suboptimal; find a way to do this without calling all the columns individually
headings = ["Date", "Start Time", "End Time", "Duration", "Focus", "Area", "Topic", "The ONE Thing"]

table_data = (
    ("1/24/2022","9:30:00 AM","9:45:00 AM","0:15:00","High","Mental","Emails","Finish Atomic Habits Analysis"),
    ("1/24/2022","4:15:00 AM","5:35:00 AM","1:20:00","High","Mental","Emails","Finish Atomic Habits email"),
    ("1/24/2022","6:05:00 AM","6:42:00 AM","0:37:00","High","Mental","Community","Follow up on open tab conversations"),
    ("1/24/2022","7:50:00 AM","8:27:00 AM","0:37:00","High","Mental","Emails","Hire someone to design email template"),
    ("1/24/2022","8:30:00 AM","10:01:00 AM","1:31:00","High","Mental","Skills","Learn sales with James"),
    ("1/24/2022","11:45:00 AM","1:15:00 PM","1:30:00","High","Financial","Income","Work on list of potential income"),
    ("1/24/2022","1:40:00 AM","1:54:00 AM","0:14:00","High","Mental","Projects","Find code mentor"),
    ("1/24/2022","7:00:00 AM","7:15:00 AM","0:15:00","High","Mental","Projects","Make a list of things I'll need to understand")
)

@app.route("/")
@app.route("/home")
@login_required
def home():
    return render_template("home.html", title="Home", tools=capture_tools)


@app.route('/register', methods = ["GET", "POST"])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = RegistrationForm()
    if form.validate_on_submit():
        hashed_password =bcrypt.generate_password_hash(form.password.data).decode('utf-8')
        user = User(username=form.username.data, email=form.email.data, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash(f'Your account has been created! You are now able to log in.', 'success')
        return redirect(url_for('login'))
    return render_template("register.html", title='Register', form=form)

@app.route('/login', methods = ["GET", "POST"])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('home'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user and bcrypt.check_password_hash(user.password, form.password.data):
            login_user(user, remember=form.remember.data)
            next_page = request.args.get('next')
            return redirect(next_page) if next_page else redirect(url_for('home'))
        else:
            flash('Login unsuccessful. Please check email and password.', 'danger')
    return render_template("login.html", title='Login', form=form)

@app.route("/data")
@login_required
def data():
    print(type(headings))
    return render_template("data.html", title="Data", headings=headings, table_data=table_data)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('home'))

@app.route('/timelog', methods=['GET', 'POST'])
@login_required
def timelog():
    # current_year = datetime.datetime.now().year
    # when the for is submitted..
    if request.method == "POST":
        # these are the named components that we are trying to pull data for
        # all of the form components seem to work while the JS created time values don't
        # TODO: figure out why the time components aren't showing up with the other data after submit

        new_row = Create_data_app_db(
            id=randint(1, 10000),
            the_one_thing=request.form['the-one-thing'],
            area_dd=request.form['area-dd'],
            topic_dd=request.form['topic-dd'],
            start_time=request.form['hidden-start-time'],
            end_time=request.form['hidden-end-time'],
            timer_secs=request.form['hidden-seconds'],
            timer_tens_of_secs=request.form['hidden-tens-secs'],
            focus_dd=request.form['focus-dd'],
            work_descript=request.form['work-description']
        )
        db.session.add(new_row)
        db.session.commit()
        # return render_template("submit-success.html")
        
    return render_template("timelog.html")

def save_picture(form_picture):
    random_hex = secrets.token_hex(8)
    _, f_ext = os.path.splitext(form_picture.filename)
    picture_fn = random_hex + f_ext
    picture_path = os.path.join(app.root_path, 'static/profile_pics', picture_fn)
    output_size = (125,125)
    i = Image.open(form_picture)
    i.thumbnail(output_size)
    i.save(picture_path)

    return picture_fn

@app.route('/account', methods=['GET', 'POST'])
@login_required
def account():
    form = UpdateAccountForm()
    if form.validate_on_submit():
        if form.picture.data:
            picture_file = save_picture(form.picture.data)
            current_user.image_file = picture_file
        current_user.username = form.username.data
        current_user.email = form.email.data
        db.session.commit()
        flash('Your account has been updated', 'success')
        return redirect(url_for('account'))
    elif request.method == "GET":
        form.username.data = current_user.username
        form.email.data = current_user.email
    image_file = url_for('static', filename='profile_pics/' + current_user.image_file)
    return render_template("account.html", title="Account", form=form, image_file=image_file)

@app.route('/dashboard')
@login_required
def dashboard():
    form = LoginForm()

    def check_for_dash():
        file_path = '/Users/thomasmulhern/Desktop/projects/DataApp2.0/datacatchr2/templates/dashboard.html'
        if os.path.isfile(file_path):
            os.remove(file_path)


    def gen_dash_html():

        import pandas as pd
        import numpy as np
        import plotly.graph_objs as go
        import plotly.offline as pyo
        import os

        # import data
        df = pd.read_excel(
            '/Users/thomasmulhern/Downloads/TotLogArchive.xlsx', index_col='Date')
        print('read into pandas')
        # convert Duration to int
        df['Duration'] = df["Duration"].apply(
            lambda x: (x.hour * 60 + x.minute) * 60 + x.second)

        # convert Duration to hours
        df['Duration'] = df['Duration'].apply(lambda x: x/60/60)

        # group by date, create running total from Duration
        tot_time = df.groupby('Date')['Duration'].sum().reset_index()

        # drop outliers
        tot_time.drop(tot_time.index[65:72], inplace=True)

        # add running total
        tot_time['run_tot'] = np.cumsum(tot_time['Duration'])

        # add burndown lines
        tot_time['goal_bd'] = np.linspace(0, 200, len(tot_time))
        tot_time['stretch_bd'] = np.linspace(0, 250, len(tot_time))

        # create traces
        trace1 = go.Bar(x=tot_time['Date'], y=tot_time['run_tot'], name='Work')
        trace2 = go.Scatter(
            x=tot_time['Date'], y=tot_time['goal_bd'], mode='lines', name='Goal')
        trace3 = go.Scatter(
            x=tot_time['Date'], y=tot_time['stretch_bd'], mode='lines', name='Stretch Goal 1')

        # Create plotly graph
        data = [trace1, trace2, trace3]
        layout = go.Layout(title='Work')
        fig = go.Figure(data=data, layout=layout)

        # Plot the graph
    #     pyo.plot(fig)

        # Write to file
        fig.write_html(
            "/Users/thomasmulhern/Desktop/projects/DataApp2.0/datacatchr2/dashboard.txt")
    check_for_dash()
    gen_dash_html()
    system("cat /Users/thomasmulhern/Desktop/projects/DataApp2.0/datacatchr2/dash1.txt \
           /Users/thomasmulhern/Desktop/projects/DataApp2.0/datacatchr2/dashboard.txt \
           /Users/thomasmulhern/Desktop/projects/DataApp2.0/datacatchr2/dash3.txt > /Users/thomasmulhern/Desktop/projects/DataApp2.0/datacatchr2/templates/dashboard.html")
    return render_template("dashboard.html", title='Dashboard')

@app.route('/tools')
def tools():
    form = LoginForm()
    return render_template("tools.html", title='Tools', tools=capture_tools)

@app.route('/studio')
@login_required
def studio():
    form = LoginForm()
    return render_template("studio.html", title='Studio')

@app.route('/web3')
@login_required
def web3():
    form = LoginForm()
    return render_template("web3.html", title='Web3')


