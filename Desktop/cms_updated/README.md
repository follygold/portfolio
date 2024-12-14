###### Setting Up Airflow  ##########
My docker file is just a replicate of what's on airflow website.
This wasn't built but was modified just for the purpose of this project. 
Peradventure the docker file fails, it's as a result of changes from airflow weh=bsite. 
Follow this link on airflow docker page 
to get started:
https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html


#### My Postgres connection ####

I followed this link to get my pg admin running on my docker container.
https://hevodata.com/learn/pgadmin-docker/. 

After setting this up, start your docker container with docker-compose up -d.
on Airflow UI, set your postgres connections.

A slight changes to the connection on Airflow ui.For your hostname here, use this:host.docker.internal
since it's hosted on docker.

To get details of your postgres database on the container, on your browser, 
go to the port number you created for your pgadmin on the docker compose file.
log in the details of email and password in that section.
Please Note: port for logging in to pg admin details is different from port for querying the database.
The port for querying the database is the postgres parameters included in the airflow script.
same applies to the password .
If your airflow script doesn't have this details, please include it. Mine is 5432:5432.
Check the image (Screenshot 2023-02-10 at 10.26.41 AM.png) file for my pg admin details on UI. 
Password detail is the airflow details in docker file.



Note: Do not touch the airflow database schema. That's where airflow stores its records.
Your working database is the postgres schema. create your schemas and tables by running all create scripts in my sql_script as well as the procedure script.