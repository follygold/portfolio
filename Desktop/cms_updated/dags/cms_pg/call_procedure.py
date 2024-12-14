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
def call_asp_pricing_procedure():
    cur=conn.cursor()
    cur.execute("call sp_upsert_asp_pricing()")
    cur.close()
    conn.close()

def call_asp_ndc_procedure():
    cur = conn.cursor()
    cur.execute("call sp_upsert_asp_ndc_hcpcs()")
    cur.close()
    conn.close()

def call_noc_ndc_procedure():
    cur = conn.cursor()
    cur.execute("call sp_upsert_noc_ndc_hcpcs()")
    cur.close()
    conn.close()


