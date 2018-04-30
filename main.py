from flask import Flask, render_template, request, redirect, url_for, session

import models as dbHandler

app = Flask(__name__)

@app.route('/')
def home():
    #return render_template('b_strap.html')
    return render_template('mytest.html')


@app.route('/signup', methods=['GET', 'POST'])
def userSignup():
    if request.method == 'POST':
        _username = request.form['username']
        _email = request.form['email']
        _passwd = request.form['password']
        _email_lst = dbHandler.userExistsCheck(_email)

        if len(_email_lst) == 0:
            dbHandler.insertUser(_username,_email,_passwd)
            return redirect(url_for('userLogin'))
#            return render_template('user_login.html')
        else:
            return render_template('user_register.html', email=_email)
    else:
        return render_template('user_register.html')


@app.route('/login', methods=['GET', 'POST'])
def userLogin():
    if request.method == 'POST':
        _username = request.form['email']
        _passwd = request.form['password']
        _usr_lst = dbHandler.authCheck(_username)

        if len(_usr_lst) == 0:
            return render_template('user_login.html', email='True')
        elif _usr_lst[0][0] == _username and _usr_lst[0][-1] == _passwd:
            session['username'] = _username
            print (session['username'])
            return render_template('user_home.html',username=_username)
        else:
            return render_template('user_login.html', passwd='True')
    else:
        return render_template('user_login.html')


@app.route('/logout')
def userLogout():
    session.pop('username', None)
    print(session)
    return redirect(url_for('home'))





# @app.route('/', methods=['GET', 'POST'])
# def home():
#     error = None
#     if request.method == 'POST':
#         if request.form['username'] != 'admin' or request.form['password'] != 'admin':
#             error = 'Invalid Credentials. Please try again.'
#         else:
#             return redirect(url_for(secret_page))
#     return render_template('login.html', error=error)


if __name__ == '__main__':
    app.debug = True
    app.secret_key = 'BN<?45;$%A0ZrH!jmN]Y&*HJWDBH4566iyQ'
    app.run(host='172.17.7.68', port=4000)
