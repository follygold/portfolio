import requests
from bs4 import BeautifulSoup
 
def website_changed(url: str):
    reqs = requests.get(url)
    soup = BeautifulSoup(reqs.text, 'html.parser')
    first_time_links = []
    #fresult = False

    def write_file():
        for link in soup.find_all('a'):
            if link.get('href').endswith('.zip'):
                with open('/opt/airflow/op_files/cms/zip_links.txt', 'w') as file:
                    file.write('https://www.cms.gov' + link.get('href') + '\n')
                    first_time_links.append('https://www.cms.gov' + link.get('href'))
    try:
        with open('/opt/airflow/op_files/cms/zip_links.txt', 'r') as file:
            if len(file.read().strip()) != 0:
                result = True
            else:
                write_file()
                print('Write in empty file.')
                return first_time_links
    except:
        write_file()
        print('Created and write in a file.')
        return first_time_links

    if result == False:
        print('Website is not changed.')
        return False
    else:
        old_data = []
        new_data = []

        with open('/opt/airflow/op_files/cms/zip_links.txt', 'r') as file:
            for line in file:
                old_data.append(line.replace('\n', ''))

        for link in soup.find_all('a'):
            if link.get('href').endswith('.zip'):
                new_data.append('https://www.cms.gov' + link.get('href'))

        # print(old_data)
        # print(new_data)
        
        updated_list = list(set(new_data).difference(set(old_data)))
        if len(updated_list) == 0:
            print('Website is not changed.')
            return "Website is not changed"
        else:
            for link in updated_list:
                with open('/opt/airflow/op_files/cms/zip_links.txt', 'w') as file:
                    file.write(link + '\n')
            # web_url = updated_list[0]
            print('Website is changed. Links: ' + str(result))
            return updated_list

def check_for_web_change(ti):
    check_web = ti.xcom_pull(task_ids='website_changed', key="return_value")
    if check_web == "false":
        return 'no_update'
    elif check_web == 'flag':
        return 'web_found'
    else:
        return 'ERROR IN WEB!!!'


        

# result = website_changed('https://www.cms.gov/medicare/medicare-part-b-drug-average-sales-price/2022-asp-drug-pricing-files')
# if result == False:
#     print('Website is not changed.')
# else:
#     print('Website is changed. Links: ' + str(result))

