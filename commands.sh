python3 -m venv ~/.ud-ci-cd-pipeline
source ~/.ud-ci-cd-pipeline/bin/activate
git clone git@github.com:miriamwanjo/Udacity-Azure-CI-CD-Pipeline.git
cd Udacity-Azure-CI-CD-Pipeline/
touch Makefile
make all
git status
git add .
git pull
git push
git commit -m "added some changes"
ls 
az webapp up --sku F1 -n ml-flask-cicd
az webapp log tail
chmod +x make_predict_azure_app.sh
./make_predict_azure_app.sh
touch commands.sh
touch locustfile.py