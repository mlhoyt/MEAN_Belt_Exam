# -*- shell -*-

GITHUB_REPO="https://github.com/mlhoyt/MEAN_Belt_Exam.git"
GITHUB_REPO_NAME="MEAN_Belt_Exam"
PROJECT_NAME="belt_exam"
PUBLIC_IP="52.15.232.219"
PRIVATE_IP="172.31.2.112"

echo "****************************************************************************************************"
echo "*** Major Installs"
echo "****************************************************************************************************"

cd ${HOME}

echo "y" > AUTO_CONFIRM

sudo apt-get update

sudo apt-get install -y build-essential openssl libssl-dev pkg-config

sudo apt-get install -y nodejs
sudo apt-get install npm < AUTO_CONFIRM

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo apt-get install git

# NOTE: Not sure why but this is done later in the mongo section
# sudo apt-get install -y mongodb-org

sudo apt-get install nginx < AUTO_CONFIRM

sudo npm install pm2 -g

echo "****************************************************************************************************"
echo "*** Get WebApp Source Code"
echo "****************************************************************************************************"

cd /var/www

sudo git clone ${GITHUB_REPO}
sudo mv ${GITHUB_REPO_NAME} ${PROJECT_NAME}

echo "****************************************************************************************************"
echo "*** nginx Configuration"
echo "****************************************************************************************************"

cd ${HOME}

cat > /tmp/${PROJECT_NAME}.nginx.cfg << EOHI
server {
  listen 80;
  location / {
    proxy_pass http://${PRIVATE_IP}:8000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_cache_bypass \$http_upgrade;
  }
}
EOHI

cat /tmp/${PROJECT_NAME}.nginx.cfg | sudo tee /etc/nginx/sites-available/${PROJECT_NAME}
sudo rm /etc/nginx/sites-available/default

sudo ln -s /etc/nginx/sites-available/${PROJECT_NAME} /etc/nginx/sites-enabled/${PROJECT_NAME}
sudo rm /etc/nginx/sites-enabled/default

echo "****************************************************************************************************"
echo "*** Build WebApp"
echo "****************************************************************************************************"

cd /var/www/${PROJECT_NAME}
sudo npm install

cd /var/www/${PROJECT_NAME}/client
sudo npm install

cd /var/www/${PROJECT_NAME}/client
sudo npm install @angular/cli
sudo ./node_modules/@angular/cli/bin/ng build

echo "****************************************************************************************************"
echo "*** Start mongod (Database)"
echo "****************************************************************************************************"

cd /var/www/${PROJECT_NAME}

sudo apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 0C49F3730359A14518585931BC711F9BA15703C6
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

echo "****************************************************************************************************"
echo "*** Start pmw (NodeJS Server)"
echo "****************************************************************************************************"

cd /var/www/${PROJECT_NAME}
pm2 start server.js
pm2 stop 0
pm2 restart 0
pm2 status

echo "Info: Waiting momentarily for pm2 (NodeJS server) to restart ..."
sleep 5

echo "****************************************************************************************************"
echo "*** Test - internal connection"
echo "****************************************************************************************************"

curl http://localhost:8000

echo "****************************************************************************************************"
echo "*** Start nginx"
echo "****************************************************************************************************"

sudo service nginx reload && sudo service nginx restart

echo "Info: Waiting momentarily for nginx to restart ..."
sleep 5

echo "****************************************************************************************************"
echo "*** Test - external connection"
echo "****************************************************************************************************"

curl http://${PUBLIC_IP}

