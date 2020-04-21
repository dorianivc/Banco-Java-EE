import pymysql
import sys

REGION = 'us-east-1'

rds_host  = "dorian-database.cy1hmbiynvfm.us-east-1.rds.amazonaws.com"
name = "banco"
password = "banco"
db_name = "Banco"

def save_events(event):
    """
    This function fetches content from mysql RDS instance
    """
    result = []
    cedula=event['cedula']
    conn = pymysql.connect(rds_host, user=name, passwd=password, db=db_name, connect_timeout=5)
    with conn.cursor() as cur:
        cur.execute(f"""insert into Banco.Cliente (idCliente, Usuario_cedula) values( '{cedula}', '{cedula}')""" )
        ##cur.execute("""select * from Banco.Usuario""")
        conn.commit()
        cur.close()
       
    return "OK"

def my_handler(event, context):
    save_events(event)



# event = {
#   "id": 777,
#   "name": "appychip"
# }
# context = ""
# main(event, context)