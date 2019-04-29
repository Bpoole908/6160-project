import pymysql
from flask import Flask, render_template
from flask import request
from flask import Response,make_response
import requests
import sys
import json

app = Flask(__name__)

def get_key(dict,val):
    for key, value in dict.items():
         if val == value:
             return key

@app.route('/', methods=['GET','POST'])
def index():
    rows=[]
    columns = {'email':'Email','name':'Name','department':'Department','phone':'Phone'}
    #columns = {'idCart':'Cart ID','idModel':'Model ID','numSeats':'Number of Seats','extraSeats':'Extra Seats'}
    print('INDEX', file=sys.stderr)
    col = json.dumps(columns)
    if request.method == 'POST':
        print('POST ', file=sys.stderr)
        #print('FORM '+request.form['field'],file=sys.stderr)
        if 'email' in request.form:
            email = request.form['email']
            department = request.form['department']
            name = request.form['name']
            phone = request.form['phone']
            print('MODEL ID',email)
            createTable(email, name, department, phone)

        if 'deletefield' in request.form:
            delfield = request.form['deletefield']
            delvalue = request.form['deletevalue']
            delfield_val = get_key(columns, delfield)
            deleteRow(delfield_val, delvalue)

        if 'wherefield' in request.form:
            print("update form",file=sys.stderr)
            updatefield = request.form['field']
            updatevalue = request.form['value']
            up_wherefield = request.form['wherefield']
            up_wherevalue = request.form['wherevalue']
            updatefield_val = get_key(columns, updatefield)
            up_wherefield_val = get_key(columns, up_wherefield)
            updateRow(updatefield_val, updatevalue, up_wherefield_val, up_wherevalue)

        rows = retrieveTable()
        print(rows,file=sys.stderr)
    return render_template('DB_CRUD.html',rows=rows, columns=col)

HOST = '127.0.0.1'
USER = 'root'
PASSWORD = ''
DATABASE = 'fortyniner golf cart rides'

# CREATE TABLE OR INSERT SOME VALUES IN EXISTING TABLE
def createTable(email, name, department, phone):
    #with con:
    conn = pymysql.connect(host=HOST,port=3306, user=USER, passwd=PASSWORD, db=DATABASE)
    cur = conn.cursor()
    print('EMAIL', email)

    #cur.execute("INSERT INTO carts(idModel, numSeats, extraSeats) VALUES(2, 4, 3)")
    query = "INSERT INTO persons(email, name, department, phone) VALUES(%s, %s, %s, %s)"
    params = (email, name, department, phone)
    cur.execute(query,params)
    conn.commit()
    conn.close()

# RETRIEVE TABLE ROWS
def retrieveTable():
    #with con:
    conn = pymysql.connect(host=HOST,port=3306, user=USER, passwd=PASSWORD, db=DATABASE)
    cur = conn.cursor()
    cur.execute("SELECT * FROM persons")
    rows = cur.fetchall()

    conn.close()
    return rows

# UPDATE ROW
def updateRow(updatefield, updatevalue, up_wherefield, up_wherevalue):
    #with con:
    conn = pymysql.connect(host=HOST, port=3306, user=USER, passwd=PASSWORD, db=DATABASE)
    cur = conn.cursor()
    query = "UPDATE persons SET "+updatefield+" = '"+updatevalue+"' WHERE "+ up_wherefield+" = '"+up_wherevalue+"'"
    print(query,file=sys.stderr)
    cur.execute(query)
    print("Number of rows updated:",  cur.rowcount)
    conn.commit()
    conn.close()

# DELETE ROW
def deleteRow(field, value):
    conn = pymysql.connect(host=HOST, port=3306, user=USER, passwd=PASSWORD, db=DATABASE)
    cur = conn.cursor()
    query = 'DELETE FROM persons WHERE '+field+' = '+str(value)
    print(query)
    cur.execute("DELETE FROM persons WHERE "+field+" = %s", str(value))
    print("Number of rows deleted:", cur.rowcount)
    conn.commit()
    conn.close()

    #con = pymysql.connect(host=HOST,port=3306, user=USER, paswd=PASSWORD, db=DATABASE);

    #cur = con.cursor()
    #cur.execute("SELECT VERSION()")
    #ver = cur.fetchone()
    #print("Database version : %s " % ver)
    # CRUD OPERATIONS
#    createTable(con)
    #retrieveTable(con)
    #updateRow(con)
    #deleteRow(con)

#except mdb.Error:
 #   #print("Error %d: %s" % (e.args[0],e.args[1]))
  #  sys.exit(1)

#finally:
 #   if con:
  #      con.close()

if __name__ == "__main__":
    app.run(debug=True)
