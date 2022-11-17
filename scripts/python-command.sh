#!/bin/bash

cd /home/sncfeedback/afeedback
sudo mkdir -p /home/sncfeedback/afeedback/project/settings/env/
sudo cp /etc/local.py /home/sncfeedback/afeedback/project/settings/env/
source /home/sncfeedback/sncfeedback_venv/bin/activate  
pip install -r requirements.txt  
python manage.py migrate  
deactivate  
sudo chown -R sncfeedback:sncfeedback /home/sncfeedback/afeedback  
sudo chown -R sncfeedback:sncfeedback /var/log/afeedback/  
sudo chown sncfeedback:sncfeedback /home/sncfeedback/.ssh/github/afeedback  
sudo systemctl restart nginx    
sudo supervisorctl restart all  