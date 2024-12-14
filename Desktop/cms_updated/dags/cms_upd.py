'''This is a dag script that automates cms asp crosswalk and asp pricing into postgres.
'''
from airflow.models.variable import Variable
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.operators.python import BranchPythonOperator
from airflow.operators.dummy_operator import DummyOperator
from airflow.utils.trigger_rule import TriggerRule
from cms_pg.page_change import *
from cms_pg.download_file import download_file
from cms_pg.extract_file import *
from cms_pg.data_load_pg import data_load_pg
from cms_pg.updates import *
from cms_pg.check_email import check_for_email
from cms_pg.download_new_files import download_zip_files
from cms_pg.load_test import *
from cms_pg.call_procedure import *
#from airflow.operators.zip import UnzipOperator
#from airflow_plugins.operators.zip.UnzipOperator

with open("/opt/airflow/ip_files/asp2.json") as json_file:
    data = json.load(json_file)
web = data["web"]
dir_path = data["file_path"]
dir_path = data["file_path"]

default_agrs = {"owner": "airflow",
                "email_on_failure": True,
                "start_date": "2022, 01, 01"}

with DAG(dag_id='cms_asp_noc', default_args=default_agrs,
         render_template_as_native_obj=True,
         template_searchpath=['/opt/airflow/sql_script/'],
         schedule_interval='@daily') as dag:
    website_changed = PythonOperator(
        task_id='website_changed',
        python_callable=website_changed,
        op_kwargs={"url": web}
    )
    # check_web_change = BranchPythonOperator(
    #     task_id='check_web_change',
    #     python_callable=check_for_web_change
    # )
    web_update = DummyOperator(task_id='no_web_change')
    download_file = PythonOperator(
        task_id='download_file',
        python_callable=download_zip_files
        # python_callable=download_file
    )
    # unzip_task = UnzipOperator(
    #     task_id='unzip_task',
    #     path_to_zip_file="/opt/airflow/op_files/cms/",
    #     path_to_unzip_contents="/opt/airflow/op_files/cms/",
    #     )
    extract_file = PythonOperator(
        task_id='extract',
        python_callable=extractfile,
        op_kwargs={"_dir": dir_path}
    )
    data_load = PythonOperator(
        task_id='data_load',
        python_callable=data_load_pg)

    test_data_load=PythonOperator(
        task_id='load_test',
        python_callable=load_test)

    #populate_all_tables = PostgresOperator(
    #     task_id="populate_all_tables",
    #     postgres_conn_id="postgres_conn",
    #     sql=['call_procedures.sql']
    # )
    call_cms_asp_procedure= PythonOperator(
        task_id="call_asp_pricing",
        python_callable= call_asp_pricing_procedure
    )
    call_ndc_hcpcs = PythonOperator(
        task_id="call_ndc_hcpcs",
        python_callable=call_asp_ndc_procedure
    )
    call_noc_ndc_procedure = PythonOperator(
     task_id="call_noc_ndc_procedure",
        python_callable=call_noc_ndc_procedure
    )

    get_files = PythonOperator(
        task_id='get_files',
        python_callable=check_all_files
    )
    check_if_file_is_empty = BranchPythonOperator(
        task_id="check_if_updates",
        python_callable=check_for_email,
        trigger_rule=TriggerRule.ONE_SUCCESS
    )
    no_update = DummyOperator(
        task_id='no_update',
        trigger_rule=TriggerRule.ONE_SUCCESS)

    file_not_found = DummyOperator(
        task_id='file_not_found',
        trigger_rule=TriggerRule.ONE_SUCCESS)

    # email_alert=EmailOperator(
    #     task_id="email_alert",
    #     to=Variable.get('new_email'),
    #     subject="CMS Alert on Daily Update for ASP Pricing, ASP crosswalk and NOC",
    #     #cc=Variable.get('Henry_email'),
    #     html_content='''<h1>Hello, Here is an update. Check attachment''',

    #     files="{{ ti.xcom_pull(task_ids='get_files',key='return_values') }}",
    # trigger_rule=TriggerRule.ONE_SUCCESS)

    email_alert = PythonOperator(task_id="email_alert",
                                 python_callable=email_actual_file,
                                 provide_context=True)

    #website_changed >>
    #check_web_change
    #check_web_change >> \
    website_changed >> [download_file,web_update]
    download_file >> extract_file >> test_data_load >> data_load >> call_cms_asp_procedure>>call_ndc_hcpcs>> call_noc_ndc_procedure>>\
    get_files >> check_if_file_is_empty >> [
        no_update, email_alert, file_not_found]
    # >
