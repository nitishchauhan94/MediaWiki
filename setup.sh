echo "Setting up Mediawiki"
echo "setup Database"
bash $PWD/Database/db.sh
echo "setup application"
bash $PWD/Application/application.sh
