import sqlite3

def insertUser(user, email, passwd):
    conn = sqlite3.connect('micro_one.db')
    cur = conn.cursor()
    cur.execute('insert into users (username,email,password) values (?,?,?)', (user, email, passwd))
    conn.commit()
    conn.close()


def authCheck(eid):
    conn = sqlite3.connect('micro_one.db')
    cur = conn.cursor()
    cur.execute('select email, password from users where email=?', (eid,))
    d_users = cur.fetchall()
    conn.close()
    return d_users

def userExistsCheck(eid):
    conn = sqlite3.connect('micro_one.db')
    cur = conn.cursor()
    cur.execute("select email from users where email=?", (eid,))
    email_lst = cur.fetchall()
    conn.close()
    return email_lst
