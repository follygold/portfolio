'''
This is just my play area for testing the connections to postgres
'''


import os
import pandas as pd
from sqlalchemy import create_engine
from airflow.models.variable import Variable
import json
import re
import time
import datetime
import psycopg2
#import psycopg2.extras as extras
with open("/opt/airflow/ip_files/asp2.json") as json_file:
    data = json.load(json_file)
path=data["file_path"]
engines=data["engine_name"]

conn = psycopg2.connect(database="postgres", user="airflow", password="airflow",
                            host="host.docker.internal")
def load_test():
    cur=conn.cursor()

    cur.execute("select * from address")
    rows=cur.fetchall()
    if not len(rows):
        print("empty")
    else:
        for row in rows:
            print(row)
    cur.close()
    conn.close()

# def test2_load():
#     conn_string = 'airflow://airflow:airflow@host.docker.internal/postgres'
#
#     db = create_engine(conn_string)
#     conne = db.connect()
#
#     conn1.autocommit=True
#     cursor= conn1.cursor()
#
#     # our dataframe
#     data = {'Name': ['Tom', 'dick', 'harry'],
#             'Age': [22, 21, 24]}
#
#     # Create DataFrame
#     df = pd.DataFrame(data)
#     df.to_sql('data', con=conne, if_exists='replace',
#               index=False)
#     # conn = psycopg2.connect(conn_string
#     #                         )
#     conn1.autocommit = True
#     cursor = conn1.cursor()
#
#     sql1 = '''select * from data;'''
#     cursor.execute(sql1)
#     for i in cursor.fetchall():
#         print(i)
#
#     conn1.commit()
#     conn1.close()
#
#
#
#
#
