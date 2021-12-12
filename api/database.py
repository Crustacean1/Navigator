import mysql.connector
mydb = mysql.connector.connect(
        host = "db",
        port = 3306,
        user = "root",
        passwd = "plsnohack",
        database = "Navigator",
        auth_plugin="mysql_native_password"
    )
cursor = mydb.cursor()
