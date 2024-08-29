# Deploying a Path-Based Routing Web Application on AWS

## Objective:

To evaluate your skills in deploying a web application on AWS using EC2 instances, configuring security groups, and setting up an Application Load Balancer (ALB) with path-based routing. You will deploy two simple web applications, configure the ALB to route traffic based on the URL path, and terminate all resources once the project is complete.

## Project Scenario:

A small company needs to deploy two lightweight web applications, "App1" and "App2," on AWS. The traffic to these applications should be routed through a single Application Load Balancer (ALB) based on the URL path. The company has opted for t2.micro instances for cost efficiency.

## Project Steps and Deliverables:

### 1. EC2 Instance Setup (30 minutes):

Launch EC2 Instances:

Launch four EC2 t2.micro instances using the Amazon Linux 2 AMI.

![1724907484775](images/Readme/1724907484775.png)



SSH into each instance and deploy a simple web application:

Deploy "App1" on one instances.

![1724907533837](images/Readme/1724907533837.png)

Deploy "App2" on another instances.

![1724907579264](images/Readme/1724907579264.png)



### 2. Security Group Configuration (20 minutes):

Create Security Groups:

Create a security group for the EC2 instances that allows inbound HTTP (port 80) and SSH (port 22) traffic from your IP address.

![1724907678066](images/Readme/1724907678066.png)



### 3. Application Load Balancer Setup with Path-Based Routing (40 minutes):

Create an Application Load Balancer (ALB):

Set up an ALB in the same VPC and subnets as your EC2 instances.

![1724907738125](images/Readme/1724907738125.png)

Now Choose ALB -> Internet facing -> Network mapping


![1724907749435](images/Readme/1724907749435.png)


Configure the ALB with two target groups:

Target Group 1: For "App1" instances.

![1724908015842](images/Readme/1724908015842.png)

Target Group 2: For "App2" instances.

![1724908062723](images/Readme/1724908062723.png)

Register the appropriate EC2 instances with each target group.

![1724908126555](images/Readme/1724908126555.png)

here it is showing for instance 1 ia attched to tagget group 1

Now for the instance 2 is attached to target group 2:
![1724908208441](images/Readme/1724908208441.png)



Configure Path-Based Routing:

Set up path-based routing rules on the ALB:

Route traffic to "App1" instances when the URL path is /app1.

Route traffic to "App2" instances when the URL path is /app2.

![1724908355566](images/Readme/1724908355566.png)

![1724908371895](images/Readme/1724908371895.png)

### 4. Testing and Validation (20 minutes):

Test Path-Based Routing:

Access the ALB's DNS name and validate that requests to /app1 are correctly routed to the "App1" instances and that /app2 requests are routed to the "App2" instances.

Now copy and paste the loadbalancer dns address:

![1724908558057](images/Readme/1724908558057.png)
![1724908541892](images/Readme/1724908541892.png)


### 5. Resource Termination (10 minutes):

Terminate EC2 Instances:

Stop and terminate all EC2 instances.

![1724908749617](images/Readme/1724908749617.png)

Delete the ALB and the associated target groups.

![1724908794812](images/Readme/1724908794812.png)

![1724908838838](images/Readme/1724908838838.png)

![1724908848450](images/Readme/1724908848450.png)



