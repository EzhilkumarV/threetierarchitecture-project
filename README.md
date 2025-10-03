# threetierarchitecture-project
"AWS 3-Tier Architecture with Route 53, ALB, EC2 Auto Scaling Groups, and RDS (Multi-AZ) for high availability and scalability."
# AWS 3-Tier Architecture 🚀
#This is an Open Source Project Developed With the Knowledge of LearnWithMithranYT -Thanks for sharing the project 
#This project demonstrates a **Highly Available & Scalable 3-Tier Architecture** on AWS 
Where The Output will be displayed as If I login on to my domain zorogaming.shop it will be hosted in worldwide If i login on to the website using user id for example the internet facing  load balancer sends the requests to the app server receives it  and in  the app server the backend where i install sql database it returns the value of password and phone

## 📌 Architecture diagram 
 below readme file

## 🏗 Components
- **Route 53** → DNS
- **ALB (Public + Internal)** → Load Balancing
- **EC2 ASG (Web + App Tiers)** → Auto Scaling
- **RDS Multi-AZ** → High Availability Database

## 🌍 Features
- High Availability (Multi-AZ)
- Scalability (Auto Scaling Groups)
- Security (Internal-only App + DB tier)
- DNS-based domain access via Route 53

## 🔧 Deployment
- Infrastructure as Code (Terraform/CloudFormation)
- CI/CD Pipeline (Optional)

  ##Deployment Steps
 1. Create a VPC

   
 2. Create 6 Subnets

 3. Subnets for Web Server

4. Subnets for App Server

   
5 Subnets for Database

6. Create Route Tables
Public Route Table: Connects with Internet Gateway and 2 public subnets.
Private Route Table: Create Private Route table for eachsubnet and Map NatGateway from each Availability zone for High Availability
No NAT for Database: If required for database patching, Map Natgateway to Database Route table

7. Create 3 Security Groups
WebServer-SG: Allows SSH (ALL), HTTP (ALL), HTTPS (ALL).
AppServer-SG: Allows 5000 from WebServer-SG, SSH from WebServer-SG, 80 from WebServer-SG, 443 from WebServer-SG.
DB-SG: Allows 3306 from AppServer-SG.
Task: Instead of three Security Group create Five Security Groups

8. Create Route 53 (R53) Hosted Zone
Create a Hosted Zone for a domain name.
Map R53 NameServer with your Domain Service Provider.

10. Validate ACM with R53
Request a Certificate for your domain name.
Create a CNAME record in R53 from ACM to validate your domain ownership.

12. Create RDS
Create a DB Subnet group at least 2 subnets needed.
Create a MySQL DB in a private subnet with DB-SG.

14. Create Web Server EC2
Launch an EC2 instance in the public subnet with WebServer-SG.

15. Create App Server EC2
Launch an EC2 instance in the private subnet with AppServer-SG.

16. Command to Login to App Server
vi zoro.pem
chmod 400 zoro.pem
ssh -i zoro.pem ec2-user@10.0.4.162

17. Setup Database
sudo yum install mysql -y
mysql -h ytdb.cpk8oagkgyaz.ap-south-1.rds.amazonaws.com -P 3306 -u admin -p
Provide queries from commands.sql file to create DB, tables, and insert data into the table.

18. Setup App Server
sudo yum install python3 python3-pip -y
pip3 install flask flask-mysql-connector flask-cors
vi app.py

nohup python3 app.py > output.log 2>&1 &
ps -ef | grep app.py

cat output.log 
curl http://10.0.3.47:5000/login

19. Setup Web Server
sudo yum install httpd -y
sudo service httpd start
cd /var/www/html/
touch index.html script.js styles.css


20. Create Application Load Balancer (ALB)
Create Backend Target Group for App Server EC2 with:
Port: 5000
Health Check Path: /login
Create Backend Load Balancer in the public subnet with:
Listener Port: 80
Attach the Target Group
Create Frontend Target Group for Web Server EC2 with:
Port: 80
Health Check Path: /
Create Frontend Load Balancer in the public subnet with:
Listener Port: 80

Attach the Target Group
21. Configure Route 53 to Load Balancer

Create an A record with alias pointing to the Frontend Load Balancer.
22. Attach ACM Certificate to Load Balancer

23. Check the Deployment steps

24.Search the domain name zorogaming.shop

25.Login page will appear
Enter the sql tables inserted commands get the output from the backend 
load balancer

