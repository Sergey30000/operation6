# Operation6
## Create project on Linux Ubuntu
1. cd /home/$USER
2. mkdir operation6_Moiseenko
3. cd ./operation6_Moiseenko
4. sudo apt install git
5. git clone https://github.com/Sergey30000/operation6.git
6. cd scripts

## Init project
1. bash init_project.sh postgres_password (Installation of everything necessary for the application)
2. bash updatePasswordPostgreSql.sh "new_password" (Updating password if your password is not "postgres")

## Start server
1. bash start_project.sh (Starting the server)

## Adding data
1. bash volunteer_token_project.sh (Receiving a volunteer token)
2. bash adding_data_project.sh "volunteer_token" (Adding test records to the database)

## Reading data
1. bash admin_token_project.sh (Receiving a admin token)
2. bash reading_data_project.sh "admin_token" (Reading test records from the database)

## Backup server and db
1. bash backup_project.sh

## Delete server and db
1. bash delete_project.sh

## Recovery server and db
1. bash recovery_project.sh "backup_2023-11-19_01-18-37.tar.gz"

## Repeat start server
1. bash start_project.sh (Starting the server)

## Reading data
1. bash admin_token_project.sh (Receiving a admin token)
2. bash reading_data_project.sh "admin_token" (Reading test records from the database)

## Check
1. bash check_project.sh (Checking successful application recovery)

## Stop project
1. bash stop_project.sh (Stop the server)

## Clear temporary files
1. bash clear_temporary_files.sh (Clear temporary files)
