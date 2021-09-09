export instantId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
export web_az=$(curl http://169.254.169.254/latest/meta-data/placement/availability-zone)
npm install
nohup npm start > nohup.out &
