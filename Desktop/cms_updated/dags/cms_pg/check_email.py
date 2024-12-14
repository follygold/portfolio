from airflow.operators.email_operator import EmailOperator
from cms_pg.updates import check_all_files
from airflow.models.variable import Variable

def check_for_email(ti):
    check_files= ti.xcom_pull(task_ids='get_files',key='check_files')
    if check_files == "NO UPDATES":
        return 'no_update'
    elif check_files == 'ERROR: FILES_NOT_FOUND':
        return 'file_not_found'
    else:
        return 'email_alert'
    
    
