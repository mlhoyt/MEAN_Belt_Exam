# -*- shell -*-

GITHUB_REPO="https://github.com/mlhoyt/MEAN_Belt_Exam.git"
GITHUB_REPO_NAME="MEAN_Belt_Exam"
PROJECT_NAME="belt_exam"
PUBLIC_IP="52.15.232.219"
PRIVATE_IP="172.31.2.112"

######################################################################

set -o vi
echo "y" > AUTO_CONFIRM

sudo apt-get update

sudo apt-get install -y build-essential openssl libssl-dev pkg-config
sudo apt-get install -y nodejs
sudo apt-get install npm < AUTO_CONFIRM

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo apt-get install git
sudo apt-get install nginx < AUTO_CONFIRM

sudo npm install pm2 -g

######################################################################

cd /var/www
sudo git clone ${GITHUB_REPO}
sudo mv ${GITHUB_REPO_NAME} ${PROJECT_NAME}
cd -

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

cat > /tmp/${PROJECT_NAME}.nginx.cfg << EOHI
server {
  listen 80;
  location / {
    proxy_pass http://<PRIVATE_IP>:8000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_cache_bypass \$http_upgrade;
  }
}
EOHI
cat /tmp/${PROJECT_NAME}.nginx.cfg \
    | sed "s/<PRIVATE_IP>/${PRIVATE_IP}/g" \
    | sudo tee /etc/nginx/sites-available/${PROJECT_NAME}
sudo rm /etc/nginx/sites-available/default
sudo ln -s /etc/nginx/sites-available/${PROJECT_NAME} /etc/nginx/sites-enabled/${PROJECT_NAME}
sudo rm /etc/nginx/sites-enabled/default

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

cd /var/www/${PROJECT_NAME}
sudo npm install
cd client
sudo npm install
sudo npm install -g @angular/cli
# <ctrl>+c  -- because this will end up in an infinite loop
sudo npm install @angular/cli
which ng
sudo ng build

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

cd /var/www/${PROJECT_NAME}
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" \
    | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo mkdir -p /data/db

## NOTE: There has to be a better way to test mongod
# sudo mongod
# <ctrl>+c

sudo service mongod start
## FYI: sudo service mongod stop

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

cd /var/www/${PROJECT_NAME}
pm2 start server.js
pm2 stop 0
pm2 restart 0
pm2 status
sudo service nginx reload && sudo service nginx restart

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

curl http://localhost:8000
curl http://${PUBLIC_IP}

