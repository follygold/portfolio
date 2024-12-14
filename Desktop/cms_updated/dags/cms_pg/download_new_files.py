import requests
from bs4 import BeautifulSoup
import os

def download_zip_files():
    # urls of corresponding websites
    web_urls = 'https://www.cms.gov/medicare/medicare-part-b-drug-average-sales-price/{}-asp-drug-pricing-files'

    txt_file_path = r'/opt/airflow/op_files/cms/zip_links.txt'  # path of text file that keeps record
    directory_path = r'/opt/airflow/op_files/cms'  # path of directory to save zip files
    base_url = 'https://www.cms.gov/'
    files_urls = []  # list to store all available zip files urls on websites
    old_urls = []  # list to store already downloaded zip files' urls


    if os.path.isdir(directory_path):
        os.chdir(directory_path)
    else:
        os.mkdir(directory_path)
        os.chdir(directory_path)
    # read the already downloaded zip files' urls
    with open(txt_file_path, 'r') as f:
        for line in f:
            old_urls.append(line.strip())

    # get urls of files from websites
    year = 2022
    while year <= 2030:
        reqs = requests.get(web_urls.format(year))
        soup = BeautifulSoup(reqs.text, 'html.parser')

        for a in soup.find_all('a'):
            href = a.get('href')
            if href.endswith('.zip'):
                files_urls.append(base_url + href)
        year += 1

    # get the new urls only
    download_urls = list(set(files_urls).difference(set(old_urls)))

    # store the new urls in the tracking text file
    with open(txt_file_path, 'a') as f:
        f.writelines(download_urls)

    # download new zip files
    for url in download_urls:
        filename = url.split('/')[-1]
        filepath = directory_path + filename
        response = requests.get(url)

        # Writing the zip file into local file system
        with open(filepath, 'ab') as output_file:
            for chunk in response.iter_content(chunk_size=1024 * 8):
                if chunk:
                    output_file.write(chunk)

        print(f'{filename} is downloaded.')

