# Dimensional Modeling Project with Azure Postgre, dbt Core and Looker

## Week 1  Create a new git repository and new branch

1. Create a New Repository
Using GitHub (or another hosting service):
Log in to GitHub (or your preferred hosting service).
Click on the “+” icon in the upper-right corner and select “New repository.”
Fill in the repository details:
Repository Name: Enter a name for your repository.
Description: (Optional) Add a description.
Public/Private: Choose the visibility of the repository.
Initialize this repository with a README

2. Copy get repo URL
3. in Visual Studio Code open terminal and navigate to directory where you want to save repo
4. Write: git clone 'your URL'
5. Create a new branch using command: git checkout -b <your-branch-name>
6. Edit Readme.md file with steps you made, don't forget to save file
7. Push all changes (run commands below) and create pull request (PR) for these changes (go to your repo on Github):
    git add .
    git commit -m "<your-comment>"
    git push origin <your-branch-name>

## Week 2  Load data into Database
Database could be Snowflake, or Postgres. In this case, it would be Postrges on Azure

1. Connect to Postgres database using DBeaver: 
    Open DBeaver
    Click on the New Database Connection button.
    Select PostgreSQL from the list of database drivers and click Next.
    Enter the connection details
        - Host: your-db-host
        - Port: your-port
        - Database: your-db-name
        - Username: your-db-user
        - Password: your-db-password
    Click Test Connection to ensure that the connection details are correct. Click OK to save the connection. DBeaver

2. Create schema in new database:
   CREATE SCHEMA raw;

__ETL process__
The ETL (Extract, Transform, Load) process is handled by Fivetran. The process involves extracting data from source (in our case the data is in Excel files that are located in Google Drive folder), transforming it into the desired format, and loading it into the PostgreSQL database on Azure. 

 Log in Fivetran
   Need firstly set up destination: 
    ![destination_Fivetran](images/image.png)
   In connectors, click on Add conector ![like in screnshot](images/image1.png)
   In search line, select your source, in this case: Google Drive
   Paste schema we created before - raw and  ![url folder](image2.png)
   CLick on Save test 

Go back to DBeaver and refresh schema with F5 or right click and you will see ![these](image3.png)
Run the following queries to check the loaded data: 
            ```select count(*)
            from raw.orders_xls_orders o;
            select count(*)
            from raw.people_xls_people p;
            select count(*)
            from raw.returns_xls_returns r;```


   


