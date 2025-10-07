# Threetierarchitecture-project
"AWS 3-Tier Architecture with Route 53, ALB, EC2 Auto Scaling Groups, and RDS (Multi-AZ) for high availability and scalability."
# AWS 3-Tier Architecture 🚀
#This is an Open Source Project Developed With the Knowledge of LearnWithMithranYT -Thanks for sharing the project 
#This project demonstrates a **Highly Available & Scalable 3-Tier Architecture** on AWS 
Where The Output will be displayed as If I login on to my domain zorogaming.shop it will be hosted in worldwide If i login on to the website using user id for example the internet facing  load balancer sends the requests to the app server receives it  and in  the app server the backend where i install sql database it returns the value of password and phone

##  Architecture diagram 
 ![Threetier Architecture](https://github.com/EzhilkumarV/threetierarchitecture-project/blob/main/Threetier-Architecture.png?raw=true)

##  Components
- **Route 53** → DNS
- **ALB (Public + Internal)** → Load Balancing
- **EC2 ASG (Web + App Tiers)** → Auto Scaling
- **RDS Multi-AZ** → High Availability Database

##  Features
- High Availability (Multi-AZ)
- Scalability (Auto Scaling Groups)
- Security (Internal-only App + DB tier)
- DNS-based domain access via Route 53

## 🔧 Deployment
- Infrastructure as Code (Terraform/CloudFormation)
- CI/CD Pipeline (Optional)

  ##Deployment Steps
   ZoroGaming AWS Deployment Project

This project demonstrates a highly available, secure, and scalable architecture on AWS for zorogaming.shop.

1️. VPC & Subnets

Create VPC

Create 6 Subnets:

2 Public Subnets → For Web Servers

2 Private Subnets → For App Servers

2 Private Subnets (DB Subnet Group) → For Databases

2️. Route Tables

Public Route Table

Connect to Internet Gateway

Associate with 2 Public Subnets

Private Route Tables

One per Availability Zone

Map NAT Gateway for Web & App Subnets

Database Subnets → No NAT (private).

(Optional: Allow NAT only for patching)

3️. Security Groups

WebServer-SG:

Allow: SSH (ALL), HTTP (ALL), HTTPS (ALL)

AppServer-SG:

Allow:

5000 from WebServer-SG

SSH from WebServer-SG

80, 443 from WebServer-SG

DB-SG:

Allow: 3306 from AppServer-SG

👉 Task Update: Instead of 3 SGs, create 5 Security Groups for more granular control.

4️. Route 53 & ACM

Route 53

Create a Hosted Zone for zorogaming.shop

Map NS with domain provider

ACM (Certificate Manager)

Request SSL Certificate for zorogaming.shop

Validate via CNAME in Route 53

5️. Database (RDS)

Create DB Subnet Group (at least 2 subnets)

Launch MySQL RDS in private subnet with DB-SG

6️. EC2 Servers

Web Server EC2 (Public Subnet, WebServer-SG)

sudo yum install httpd -y
sudo service httpd start
cd /var/www/html/
touch index.html script.js styles.css


App Server EC2 (Private Subnet, AppServer-SG)

sudo yum install python3 python3-pip -y
pip3 install flask flask-mysql-connector flask-cors

vi app.py
nohup python3 app.py > output.log 2>&1 &
ps -ef | grep app.py
cat output.log
curl http://10.0.3.47:5000/login


Login to App Server

vi zoro.pem
chmod 400 zoro.pem
ssh -i zoro.pem ec2-user@10.0.4.162

7️. Database Setup
sudo yum install mysql -y
mysql -h ytdb.cpk8oagkgyaz.ap-south-1.rds.amazonaws.com -P 3306 -u admin -p


Run SQL queries from commands.sql to create DB, tables, and insert data.

8️. Load Balancers

Application Load Balancer (Backend)

Target Group → App Server EC2

Port: 5000

Health Check Path: /login

Listener Port: 80

Frontend Load Balancer

Target Group → Web Server EC2

Port: 80

Health Check Path: /

Listener Port: 80

9️. Route 53 & SSL Integration

Create A Record (Alias) → Frontend Load Balancer

Attach ACM Certificate → Load Balancer

10. Final Validation

Visit 👉 awszorogaming.shop

Login Page should appear

Enter DB credentials → Query data from backend (via ALB → App Server → RDS)
