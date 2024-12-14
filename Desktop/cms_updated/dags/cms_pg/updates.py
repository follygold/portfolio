from airflow.operators.email_operator import EmailOperator
from airflow.hooks.postgres_hook import PostgresHook    
from airflow.operators.python import BranchPythonOperator  
from airflow.models.variable import Variable
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago
from airflow.providers.postgres.operators.postgres import PostgresOperator
from cms_pg.download_file import download_file
from cms_pg.extract_file import extractfile
#from cms_croswalk.cmsload import data_load_pg
from datetime import datetime,timedelta

#from cms_pg.final_file import load_data_pg
from cms_pg.page_change import website_changed
#from dags.cms_croswalk.cmsload import load_crosswalk
from cms_pg.data_load_pg import data_load_pg
import smtplib
from email.message import EmailMessage
from airflow.utils.email import send_email 
import csv
import logging
import json
import psycopg2
with open("/opt/airflow/ip_files/asp2.json") as json_file:
    data = json.load(json_file)
path=data["file_path"]
engine=data["engine_name"]

def get_asp_pricing_updates():
    conn = psycopg2.connect(database="postgres", user="airflow", password="airflow",
                            host="host.docker.internal")
    cursor = conn.cursor()
    cursor.execute(f"select * from cms.asppricing_audit where cast(auditdate as date) = cast(now() as date)")
    with open("/opt/airflow/op_files/cms/asp_pricing_update.txt","w") as f:
        csv_writer=csv.writer(f)
        csv_writer.writerow([i[0] for i in cursor.description])
        csv_writer.writerows(cursor)
    cursor.close()
    conn.close()
    logging.info("updated asp_pricing")
    
    
def get_asp_ndc_hcpcs_updates():
    conn = psycopg2.connect(database="postgres", user="airflow", password="airflow",
                            host="host.docker.internal")
    cursor = conn.cursor()
    cursor.execute(f"select * from cms.asp_ndc_hcpcs_audit where cast(auditdate as date) = cast(now() as date)")
    with open("/opt/airflow/op_files/cms/asp_ndc_hcpcs_update.txt","w") as f:
        csv_writer=csv.writer(f)
        csv_writer.writerow([i[0] for i in cursor.description])
        csv_writer.writerows(cursor)
    cursor.close()
    conn.close()
    logging.info("updated asp_ndc_hcpcs")
    
def get_noc_ndc_hcpcs_updates():
    conn = psycopg2.connect(database="postgres", user="airflow", password="airflow",
                            host="host.docker.internal")

    cursor = conn.cursor()
    cursor.execute('select * from cms."NOC_NDC_HCPCS_audit" where cast(auditdate as date) = cast(now() as date)')
    with open("/opt/airflow/op_files/cms/NOC_NDC_HCPCS_update.txt","w") as f:
        csv_writer=csv.writer(f)
        csv_writer.writerow([i[0] for i in cursor.description])
        csv_writer.writerows(cursor)
    cursor.close()
    conn.close()
    logging.info("updated noc_ndc_hcpcs")
    
result=[]   
def check_all_files():
    # call all 3 functions
    get_asp_pricing_updates()
    get_asp_ndc_hcpcs_updates()
    get_noc_ndc_hcpcs_updates()

    # function to check if file is empty or not
    def is_file_empty(file_name: str):
        try:
            with open(file_name, 'r') as file:
                # data = file.read()
                # length_of_text = len(data.replace('\n', '').replace('\t', '').strip())
                data = []
                for line in file:
                    data.append(line.replace('\n', ''))
                if len(data) <= 1:
                    return True
                else:
                    return False
        except:
            return 'ERROR: FILE_NOT_FOUND'
    
    # check all 3 files'
    files = ['asp_pricing_update.txt', 'asp_ndc_hcpcs_update.txt', 'NOC_NDC_HCPCS_update.txt']
    results = []
    results.append(is_file_empty(path + files[0]))
    results.append(is_file_empty(path + files[1]))
    results.append(is_file_empty(path + files[2]))
    
    # return results
    if results[0] == True and results[1] == True and results[2] == True :
        return 'NO UPDATES'
    else:
        result = []
        for index, data in enumerate(results):
            if data == False:
                result.append(path + files[index])
        if len(result) == 0:
            return 'ERROR: FILES_NOT_FOUND'
        else:
            return result
     
def email_actual_file(ti, **kwargs):
    check_all_files()
    print(result)
    if any(result) == True:
        email = EmailOperator( task_id="email_alert",
                                  to='afolakebaiyewu@yahoo.com',
                                  subject="CMS Alert on Daily Update for ASP Pricing, ASP crosswalk and NOC",
                                  #cc=Variable.get('Henry_email'),
                                  html_content='''<h1>Hello, Here is an update. Check attachment''',
                                  #dag = context.get("dag"),
                                  files=[*result])
        email.execute(context=kwargs)