import urllib
import requests
import os
from pathlib import Path
import json
import os.path
from airflow.operators.python_operator import PythonOperator
from cms_pg.page_change import website_changed
from zipfile import ZipFile
#with open("/usr/local/airflow/dags/includes/config.json") as config_file:
with open("/opt/airflow/ip_files/asp2.json") as json_file:
    data = json.load(json_file)
web=data["web"]  
download_path=data["download_path"]
#file_path_cms=data["file_path"]
result = website_changed(web)




def download_file():
    with open('/opt/airflow/op_files/cms/zip_links.txt', 'r') as links:
        for link in links:
            if link:
                filename1= link.split('/')[-1]
                filename= filename1[:-1]
                filepath=os.path.join(download_path,filename)
                #link = baseurl + link
                print(filename + ' file started to download')
                response = requests.get(link[:-1])

                # Writing the zip file into local file system
                with open(filepath,'ab') as output_file:
                    for chunk in response.iter_content(chunk_size=1024*8):
                        if chunk:
                            #output_file.write(response.content)
                            output_file.write(chunk)
                            print(filename + 'file is downloaded')
        
    
    
        
    
    # result = website_changed('https://www.cms.gov/medicare/medicare-part-b-drug-average-sales-price/2022-asp-drug-pricing-files')
    # if result != "Website is not changed":
    #     for link in result:
    # #        
    #         file_name = link.split('/')[-1] 
    #         print( "Downloading file:%s"%file_name) 
            
           
    #         r = requests.get(link, stream = True) 
    #             # download started 
    #         with open(file_name, 'ab') as f: 
    #                 for chunk in r.iter_content(chunk_size = 1024*1024): 
    #                     if chunk: 
    #                         f.write(chunk) 
    # #                         

    #         print( "%s downloaded!\n"%file_name )
    
    #         print ("All links downloaded!")
          