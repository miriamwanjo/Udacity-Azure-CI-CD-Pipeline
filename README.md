# Overview

This project details steps for building a Github repository and creating an application scaffolding for a Machine Learning Flask Web App, to perform both continuous integration and continuous delivery. First by using Github Actions to perform an initial test and then integrating the application with Azure Pipelines to enable continuous delivery to Azure App Service. . 

## Project Plan
The first step is to create a project plan detailing what the tasks are, goals, deadlines, level of difficulty for each task, the person who is responsible for each task etc. This is essential for tracking tasks and making sure that each outlined task is completed in a timely manner in order to ensure completion of all tasks by the target completion date. 

* A link to a Trello board for this project
 https://trello.com/b/rBTAIP7Q/build-a-ci-cd-pipeline-project

* A link to a spreadsheet that includes the original and final project plan>
https://docs.google.com/spreadsheets/d/1qpCGKQe1nXdEB18FjAw5xvyuGp2dEQqrv6jw8nJYfxs/edit?usp=sharing

## Instructions
### Setting up the Azure Cloud Shell
  1. Create a Github Repo and initialize it with a READMe file and add a gitignore for python and ensure it is integrated with Azure Pipelines. 
  2. Go to the Azure portal and open a terminal. 
  3. Create and activate a python virtual environment by running:
      `python3 -m venv~/.<yourreponame>`
       then
      `source ~/.<yourreponame>/bin/activate`
  4. Create an ssh key to communicate with Github by running:
      `ssh-keygen -t rsa`
  5. Open the .pub file using the cat command and copy the key in the file for example: 
      `cat </path>.ssh/id_rsa.pub`
  6. Go back to your github profile, under settings select SSH and GPG keys - paste the SSH key.
  7. Now you can do a git clone of the repo - hover over to your repo and click the code icon, select SSH and copy the SSH clone. 
  8. Go back to the Azure terminal and clone your repo by running
        `git clone<yoursshkey>`
      - ![azure-cloud-shell-clone](https://user-images.githubusercontent.com/41089682/111539218-9c4c5300-873b-11eb-800a-ad9744bdf5f6.PNG)
   10. cd into your repo and you are ready for the next steps.
 
 ### Project Scaffolding - 
  The application scaffolding contains:
  * Makefile 
  * requirements.txt
  * python script (hello.py)
  * test file (hello_test.py)
    
  ### Local Continuous Integration setup
   1. First we need to do a local test to ensure that everything works. Once the scaffolding files are created, run `make all` on the azure terminal.
   2. This triggers the install, lint and test steps outlined in the makefile. (all the steps should pass)
   
      ![make_all-screenshot](https://user-images.githubusercontent.com/41089682/111541573-aae83980-873e-11eb-9d0b-50382827ea9e.PNG)
      
  #### Continuous Integration - Github Actions
  Ensure that you track all the changes to your github repo by running `git status`, `git add .`, `git commit -m "message"` and `git push`.
  In this step you will configure Github Actions to perform continuous integration remotely. this ensures that your code is continuously tested everytime new changes are 
      made to your repository depending on the series of commands you specify in the github actions config. 
  1. On the Github profile navigate to your repo and select Actions - choose 'set up yourself' option.
  2. This creates a yml code which you can edit yourself
  3. Push the changes to Github - navigate back to your repo , then select Actions again and the github workflow should now appear - click on it and select the yml file.
  4. Then click on 'build' and this should run to verify the lint and test steps pass.
    ![github-actions-screenshot](https://user-images.githubusercontent.com/41089682/111696334-324ab100-8802-11eb-8a35-c862232efbea.PNG)
    
  ### Create Badge  
   You can create a status badge as well by selecting the create badge option, copy and paste the link to your readme. 
    [![Python application test with Github Actions](https://github.com/miriamwanjo/Udacity-Azure-CI-CD-Pipeline/actions/workflows/main.yml/badge.svg)](https://github.com/miriamwanjo/Udacity-Azure-CI-CD-Pipeline/actions/workflows/main.yml)
    
  ### Continuous Delivery - Azure Pipelines & Azure App Service
   1. On the Azure portal, navigate to Azure Devops organizations, and create a new project, under service connection ensure that its connected to your subscription and       resource group. 
   2. On the Azure terminal, create an app service and deploy your app:
          `az webapp up --sku F1 -n <yourappservicename>`
 
        **the name has to be unique
        To verify the deployed application on your browser go to
       `https://<your-appservice>.azurewebsites.net/` and you should see the words in the html part on the app.py file
       ![app url verification](https://user-images.githubusercontent.com/41089682/111698561-fa913880-8804-11eb-8041-24c3fdbc2c83.PNG)
      
   3. On the terminal, perform a prediction to ensure that everything is working by running 
        `./make_predict_azure_app.sh`
      If you get an error, run 
       `chmod +x make_predict_azure_app.sh` first
       
       This should output
       ![make_prediction screenshot](https://user-images.githubusercontent.com/41089682/111698903-61165680-8805-11eb-8f4a-a0c14e7b709c.PNG)
      
   ##### Perfomance Testing of my ML API 
   In order to do test how many users my website can serve concurrently, I used Locust and tested 20 users at a hatch rate of 2 seconds. By the time I took the screenshot, 143 requests had been passed to my website and the API could effectively handle 4.6 requests per second (RPS). 
   Steps:
   1. In the command prompt (not in Azure cloud shell), install locust: `pip install locust`
   2. Navigate to your repo where the locustfile is stored using `cd <pathtorepo>` 
   3. run locust using your website url as a host. for example: `locust -f locustfile.py --host https://ml-flask-cicd.azurewebsites.net'
   4. The go to http://localhost:8089/ and enter the number of users and hatch rate you prefer and then start click on "start swarming"
   
![Locust Screenshot](https://user-images.githubusercontent.com/41089682/112678807-67c25080-8e39-11eb-976f-1356ea33707c.PNG)

![locustCharts](https://user-images.githubusercontent.com/41089682/112678793-62650600-8e39-11eb-95e1-2a14cfe4f321.PNG)
       
   4. Inspect the logs of your application on your browser: `https://<app-name>.scm.azurewebsites.net/api/logs/docker`
   
       ![logs_docker](https://user-images.githubusercontent.com/41089682/111699415-147f4b00-8806-11eb-99fb-1c72a9f9b3ff.PNG)

   5. In your project page, select Pipeline and create a new Pipeline and connect to your Github repository.
   6. Configure Python to Linux Web App on Azure and select wep app name. 
   7. This will create a YAML file. Select Save and Run and this will commit the YAML file to your github repo and run the build and deploy job.
          ![azurepipeline screenshot](https://user-images.githubusercontent.com/41089682/111698636-0bda4500-8805-11eb-9438-75cf692f8d6d.PNG)
         
   8. Now that your continuous delivery is set up, you can push any changes to your github repo and this automatically triggers your pipeline to run and test - making sure that your project is always in a testable and deployable state which is the main point of continuous integration/ continuous delivery

   9. Once you are done, ensure to go back to your azure portal and delete all the resources you have created including the resource groups and the app services so that you do not incur additional costs. 
   
#### Architecture Diagram

   ![Azure CI_CD Architecture](https://user-images.githubusercontent.com/41089682/112881108-e5cc6480-9090-11eb-954c-5b1e452e1782.png)

## Enhancements

The project expectations were clearly outlined and the way the project was broken down into different categories helped to create an understanding on how each step relates to another. The machine learning prediction app was interesting as well. 

## Demo 

<Screencast link: https://www.screencast.com/t/RdmldxC7


