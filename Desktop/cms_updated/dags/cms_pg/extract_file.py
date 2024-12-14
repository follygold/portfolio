from zipfile import ZipFile
import zipfile,os

#folder_dir =data["file_path"]
dir_path =  "/opt/airflow/op_files/cms_zip_files/"
def extractfile():
    for item in os.listdir(dir_path):  # loop through items in dir
        if item.endswith(".zip"): # check for ".zip" extension
            #print(item)
            file_name = os.path.join(dir_path,item) # get full path of files
            print(file_name)
            zip_ref = zipfile.ZipFile(file_name) # create zipfile object
            zip_ref.extractall(dir_path) # extract file to dir
            zip_ref.close() # close file




# import os
# from zipfile import ZipFile
# import zipfile
# import json
# import glob
#
#
#
#
# with open("/opt/airflow/ip_files/asp2.json") as json_file:
#     data = json.load(json_file)
#
# dir_path =  "/opt/airflow/op_files/cms/"
# #os.chdir(dir_path)
# #extension = ".zip"
#
#
# def extractfile():
#         for item in os.listdir(dir_path):  # loop through items in dir
#             if item.endswith(".zip"):  # check for ".zip" extension
#                 # print(item)
#                 file_name = os.path.join(dir_path, item)  # get full path of files
#                 print(file_name)
#                 zip_ref = zipfile.ZipFile(file_name)  # create zipfile object
#                 zip_ref.extractall(dir_path)  # extract file to dir
#                 zip_ref.close()  # close file



    # files = os.listdir(dir_path)
    # for item in os.listdir(dir_path):  # loop through items in dir
    #     if item.endswith(".zip"):  # check for ".zip" extension
    #         file_name = os.path.abspath(item)  # get full path of files
    #         zip_ref = zipfile.ZipFile(file_name)  # create zipfile object
    #         zip_ref.extractall(dir_path)  # extract file to dir
    #         zip_ref.close()  # close file

    # for file in files:
    #     if file.endswith('.zip'):
    #         filePath = dir_path + '/' + file
    # zip_files = zipfile.ZipFile(filePath)
    # for names in zip_files.namelist():
    #      zip_files.extract(names, dir_path)


    #files = os.listdir(dir_path)
    # for file in glob.glob(dir_path+'/*.zip'):
    #     print (file)
    #     zip_ref=zipfile.ZipFile(file,'r')
    #     zip_ref.extract(file,dir_path)
    #     zip_ref.close()











        #zip_files.close()
    # files = os.listdir(f'{path}')
    #     print('files',files)
    #     for file in files:
    #         if file.endswith('.zip'):
    #             filePath=dir_path+'/'+file
    #             zip_files = zipfile.ZipFile(filePath)
    #             print('zip_file',zip_files)
    #             for names in zip_files.namelist():
    #                 zip_files.extractall(names,f'{path}')
    #         zip_files.close()

    # for item in os.listdir(dir_path):  # loop through items in dir
    #     if item.endswith(extension): # check for ".zip" extension
    #         file_name = os.path.abspath(item) # get full path of files
    #         zip_ref = zipfile.ZipFile(file_name) # create zipfile object
    #         zip_ref.extractall(dir_path) # extract file to dir
    #         zip_ref.close() # close file

   # extractfile(base_dir)
    # for file in os.listdir(path):
    #     if file.endswith('.zip'):
    #         file_name = os.path.abspath(file)
    #             #filePath=path+'/'+file
    #         zip_file = zipfile.ZipFile(file_name)
    #             #for names in zip_file.namelist():
    #         zip_file.extractall(path,file_name)
    #         zip_file.close()


# with open("/opt/airflow/ip_files/asp2.json") as json_file:
#     data = json.load(json_file)
# path=data["file_path"]
# def extractfile():
#     files = os.listdir(f'{path}')
#     print('files',files)
#     for file in files:
#         if file.endswith('.zip'):
#             filePath=path+'/'+file
#             zip_files = zipfile.ZipFile(filePath)
#             print('zip_file',zip_files)
#             for names in zip_files.namelist():
#                 zip_files.extractall(names,f'{path}')
#         zip_files.close()
#
#         import os, zipfile
#
# dir_name = 'C:\\SomeDirectory'
# extension = ".zip"
#
# os.chdir(path) # change directory from working dir to dir with files
# def extract_file():
#     for item in os.listdir(path): # loop through items in dir
#         if item.endswith(extension): # check for ".zip" extension
#             file_name = os.path.abspath(item) # get full path of files
#             zip_ref = zipfile.ZipFile(file_name) # create zipfile object
#             zip_ref.extractall(dir_name) # extract file to dir
#             zip_ref.close() # close file
#             #os.remove(file_name) # delete zipped file