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
    contractor_types = ['os.fiz.','PL','Foreign','N/A']

    for line in lines:
        data = line.split(",")
        
        contractorType = 1 
        if data[3].strip()[0].isnumeric() == False:
            contractorType = 2
        if data[3].strip() == 'osoba fizyczna' or data[3].strip() == 'os. fiz.':
            contractorType = 0

        invoices.append("("+str(0) + ",'"+data[0]+"','"+data[1]+"','"+data[2]+"','"+ contractor_types[contractorType]+"','"+data[3]+"',"+ ",".join([(x.replace(".","")) for x in data[4:11]])+","+str(id)+")")
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
    # navigator = mysql.connector.connect(
    #     host="localhost",
    #     database="Navigator",
    #     user="root",
    #     password="root"
    # )
    # mycursor = navigator.cursor()
    invoices,items = parseInvoices("./data.csv")

    #print("INSERT INTO Navigator.Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorNip,invoiceId) values " + ",".join(invoices))
    print("INSERT INTO Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorType,contractorNip,pit17,pit15,pit12,pit10,pit85,pit55,pit03,invoiceId) VALUES " + ",".join(invoices))
    print("INSERT INTO Items (taxBracket,paymentValue,invoiceId) VALUES " + ",".join(items))
    print("INSERT INTO Users (login,password,name,surname,nip) values ('jp2','gmd','janusz','pavlacz','2137')")
    # mycursor.execute("INSERT INTO Invoices (userId,registrationDate,transactionDate,idCardNumber,contractorType,contractorNip,invoiceId) VALUES " + ",".join(invoices))
    # mycursor.execute("INSERT INTO Items (taxBracket,paymentValue,invoiceId) VALUES " + ",".join(items))
    # mycursor.execute("INSERT INTO Users (login,password,name,surname,nip) values ('jp2','gmd','janusz','pavlacz','2137')")
    # navigator.commit()
    # navigator.close()
    
fillDb()
