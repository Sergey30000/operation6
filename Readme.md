//1.1 Create project on Linux Ubuntu
cd /home/$USER
mkdir operation6_Moiseenko
cd ./operation6_Moiseenko
sudo apt install git
git clone https://github.com/Sergey30000/operation6.git
cd scripts

//1.2 Init project
bash init_project.sh postgres_password //Installation of everything necessary for the application
bash updatePasswordPostgreSql.sh "new_password" //Updating password if your password is not "postgres"

//1.3 Start server
bash start_project.sh //Starting the server

//2.1 Adding data
bash volunteer_token_project.sh //Receiving a volunteer token
bash adding_data_project.sh "volunteer_token" //Adding test records to the database

//2.2 Reading data
bash admin_token_project.sh //Receiving a admin token
bash reading_data_project.sh "admin_token" //Reading test records from the database

//3 Backup server and db
bash backup_project.sh

//4 Delete server and db
bash delete_project.sh

//5 Recovery server and db
bash recovery_project.sh "backup_2023-11-19_01-18-37.tar.gz"

//6.1 Repeat start server
bash start_project.sh //Starting the server

//6.2 Reading data
bash admin_token_project.sh //Receiving a admin token
bash reading_data_project.sh "admin_token" //Reading test records from the database

//6.3 Check
bash check_project.sh //Checking successful application recovery

//6.4 Stop project
bash stop_project.sh //Stop the server

//6.5 Clear temporary files
bash clear_temporary_files.sh //Clear temporary files
