""" dfsaf """
import mysql.connector

def parseInvoices(filename):
    try:
        lines = open(filename).readlines()
    except Exception as e:
        print("failed to open file ",filename)
    invoices = []
    items = []
    id = 0
    tax_brackets = ['17','15','12.5','10','8.5','5.5','3']
    for line in lines:
        data = line.split(",")
        
        invoices.append("("+str(0) + ",'"+data[0]+"','"+data[1]+"','"+data[2]+"','"+data[3]+"',"+str(id)+")")
        #print(invoices[-1])
        i = 0
        for value in data[4:11]:
            if value.replace(".","").replace(",","") != "0":
                items.append("('"+tax_brackets[i]+"',"+value.replace(".","").replace(",","")+","+str(id)+")")
                #print(items[-1])
            i += 1
        id += 1
    return invoices,items

def fillDb():
    navigator = mysql.connector.connect(
        host="localhost",
        database="Navigator",
        user="root",
        password="root"
    )
    mycursor = navigator.cursor()
    invoices,items = parseInvoices("./data.csv")

    #print("INSERT INTO Navigator.Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorNip,invoiceId) values " + ",".join(invoices))
    mycursor.execute("INSERT INTO Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorNip,invoiceId) VALUES " + ",".join(invoices))
    mycursor.execute("INSERT INTO Items (taxBracket,paymentValue,invoiceId) VALUES " + ",".join(items))
    navigator.commit()
    navigator.close()
    
fillDb()
