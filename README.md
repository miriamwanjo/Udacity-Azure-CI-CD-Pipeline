# Overview

This project details steps for building a Github repository and creating an application scaffolding for a Machine Learning Flask Web App.  to perform both continuous intergration and continuous delivery. First by using Github Actions to perform an initial test and then integrating the application with Azure Pipelines to enable continuous delivery to Azure App Service. . 

## Project Plan
The first step is to create a project plan detailing what the tasks are, goals, deadlines, level of difficuly for each task, ther person who is responsible foe each task etc. This is essential for tracking tasks and making sure that each outlined task is completed in a timely manner in order to ensure completion of all tasks by the target completion date. 

* A link to a Trello board for this project
 https://trello.com/b/rBTAIP7Q/build-a-ci-cd-pipeline-project

* A link to a spreadsheet that includes the original and final project plan>
https://docs.google.com/spreadsheets/d/1qpCGKQe1nXdEB18FjAw5xvyuGp2dEQqrv6jw8nJYfxs/edit?usp=sharing

## Instructions
### Setting up the Azure Cloud Shell
  1. Create a Github Repo and initialize it with a READMe file adnd add a gitignore for python and ensure it is integrated with Azure Pipelines. 
  2. Go to the Azure portal and open a terminal. 
  3. Create and acticate a python virtual environment by running:
      python3 -m venv~/.<yourreponame>
       then
      source ~/.<yourreponame>/bin/activate
  4. Create an ssh key to communicate with Github by running:
      ssh-keygen -t rsa
  5. Open the .pub file using the cat command and copy the key in the file for example: 
      cat </path>.ssh/id_rsa.pub
  6. Go back to your github progile, uner settings select SSH and GPG keys - paste the SSH key.
  7. Now you can do a git clone of the repo - hover over to your repo and click the code icon, select SSH and copy the SSH clone. 
  8. Go back to the Azure terminal and clone your repo by running
        git clone<yoursshkey>
      - ![azure-cloud-shell-clone](https://user-images.githubusercontent.com/41089682/111539218-9c4c5300-873b-11eb-800a-ad9744bdf5f6.PNG)
   10. cd into your repo and you are ready for the next steos.
 
 ### Project Scaffolding - 
   The application scaffolding contains:
     - Makefile 
     - requirements.txt
     - python script (hello.py)
     - test file (hello_test.py)
     - 
  ### Local Continuous Integration setup
   1. First we need to do a local test to ensure that everything works. Once the scaffolding files are created, run make all on the azure terminal.
   2. This triggers the install, lint and test steps outlined in the makefile. 
   
      ![make_all-screenshot](https://user-images.githubusercontent.com/41089682/111541573-aae83980-873e-11eb-9d0b-50382827ea9e.PNG)
      
  #### Continuous Integration - Github Actions
   Ensure that you track all the changes to your github repo by running git status, git add ., git commit -m "message" and git push.
   In this step you will configure Github Actions to perform continuous integration remotely. this ensures that your code is continuously tested everytime new changes are 
      made to your repository depending on the seried of commnads you specify in the github actions config. 
    
    


     
     
     

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 
[![Python application test with Github Actions](https://github.com/miriamwanjo/Udacity-Azure-CI-CD-Pipeline/actions/workflows/main.yml/badge.svg)](https://github.com/miriamwanjo/Udacity-Azure-CI-CD-Pipeline/actions/workflows/main.yml)

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


