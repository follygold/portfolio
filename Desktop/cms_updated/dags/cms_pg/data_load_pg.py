
'''
Name:Afolake Simbiat
this file is:
1. get all the csv files
2. Remove files with covid and introduction
3. Read files in pandas
4. Rename column names
5. Based on the file name, you're skipping rows
6. Add first column with "date_uploaded" column
7. Add date_modified, date_created and quarter column
8. Insert the data into sql DB
  on first load, append. on further load,
'''
import os
import pandas as pd
from sqlalchemy import create_engine
from airflow.models.variable import Variable
import json
import re
import time
import datetime
with open("/opt/airflow/ip_files/asp2.json") as json_file:
    data = json.load(json_file)
path=data["download_path"]
engines=data["engine_name"]
'''
def get_date(file_name: str):
    months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    file_name_words = file_name[:-4].split()
    date_created = ''
    date_modified = ''
    for index, month in enumerate(months):
        if month == file_name_words[4].lower():
            date_created = file_name_words[5] + '-' + str(index + 1).rjust(2, '0') + '-01 10:10:10'
    date = file_name_words[-1]
    date_modified = '20' + date[-2:] + '-' + date[:2] + '-' + date[2:4] + ' 00:00:00'
    return date_created, date_modified # not this, the new ccode
'''
def get_quarter(file_name: str):
    '''Pass the CSV file name.'''
    months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    name_list = file_name.split()
    quarter = False
    for index, month in enumerate(months):
        if month == name_list[4].lower():
            quarter = str(int((index)/3)+1)
    if quarter == False:
        raise Exception('FILE_NAME_ERROR')
    else:
        return quarter
    
def get_date(file_name: str):
    months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    file_name_words = file_name[:-4].split()
    date_created = ''
    date_modified = ''
    # code for date created
    for index, month in enumerate(months):
        if month == file_name_words[4].lower():
            date_created = file_name_words[5] + '-' + str(index + 1).rjust(2, '0') + '-01 10:10:10'
    # code for date modified
    date = file_name_words[-1].replace('Crosswalk_', '')
    if len(date) == 8 and date.isdigit():
        date_modified = date[-4:] + '-' + date[-8:-6] + '-' + date[-6:-4] + ' 10:10:10'
    elif len(date) == 7 and date[-4:].isdigit():
        for index, month in enumerate(months):
            if date[-7:-4].lower() in month:
                date_modified = date[-4:] + '-' + str(index + 1).rjust(2, '0') + '-01 10:10:10'
    elif len(date) == 6 and date.isdigit():
        date_modified = '20' + date[-2:] + '-' + date[-6:-4] + '-' + date[-4:-2] + ' 10:10:10'
    else:
        date_modified = '2022-06-01 10:10:10'   # dummy date
    # code for empty date created
    if date_created == '':
        date_created = date_modified
    return date_created, date_modified
    
def data_load_pg():
    all_files = os.listdir(f'{path}')    
    csv_files = list(filter(lambda f: f.endswith('.csv'), all_files))
    print(csv_files)
    for i in range(len(csv_files)):
        file=csv_files[i]
        fn_list = file.split()
        file_link=os.path.join(path,file)
        print(file_link)
        if 'covid' in file.lower():
            os.remove(file_link) 
        elif 'introduction' in file.lower():
            os.remove(file_link)
        else:
            table_name = fn_list[6] + ' ' + fn_list[7] 
            df=pd.read_csv(f'{path}/{file}',encoding= 'latin1',skiprows=8)
            print("success")
            print(file)
            df.columns = [re.sub(' ', '_', col) for col in df.columns]
            print('excel file has been cleaned')
            if 'ASP NDC-HCPCS' in file:
                df.columns.values[0]='Code' 
            elif 'OPPS NDC-HCPCS' in file:
                df.columns.values[0]='Code' 
            elif 'NOC NDC-HCPCS' in file:
                df=pd.read_csv(f'{path}/{file}',encoding= 'latin1',skiprows=9)
            elif 'NOC Pricing' in file:
                df=pd.read_csv(f'{path}/{file}',encoding= 'latin1',skiprows=12)
            df.insert(0,'Date_Uploaded',datetime.datetime.now().strftime('%Y-%m-%d'))
            df['Date_created'], df['modification_time'] = get_date(file) 
            df['quarter'] = get_quarter(file) 
            print(df)
            engine_names=create_engine(engines)
            df.to_sql(table_name, engine_names, if_exists= 'replace', index= False)
                #printing the file to be deleted
            print('deleted: ',file)
            os.remove(file_link) 
    
    
