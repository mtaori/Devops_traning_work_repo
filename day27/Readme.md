#### Project Objective:

This project will test your ability to deploy a multi-tier architecture application using AWS CloudFormation. The deployment should include an EC2 instance, an S3 bucket, a MySQL DB instance in RDS, and a VPC, all within the specified constraints.

#### Project Overview:

You are required to design and deploy a multi-tier application using AWS CloudFormation. The architecture will include the following components:

1. EC2 Instance: Serve as the web server.
2. S3 Bucket: Store static assets or configuration files.
3. RDS MySQL DB Instance: Serve as the database backend.
4. VPC: Ensure secure communication between the components.

#### Specifications:

* EC2 Instance: Use a t2.micro instance type, located in the public subnet, with SSH access allowed from a specific IP range.
* RDS MySQL DB Instance: Use a t3.micro instance type, located in a private subnet.
* S3 Bucket: Use for storing configuration files or assets for the web server.
* VPC: Create a VPC with public and private subnets. No NAT Gateway or Elastic IP should be used. Internet access for the EC2 instance should be provided via an Internet Gateway attached to the VPC.
* CloudFormation Template: Participants must create a CloudFormation template to automate the deployment process.
* Allowed Regions: Deployment is restricted to the regions us-east-1, us-east-2, us-west-1, and us-west-2.

#### Key Tasks:

1. Create a CloudFormation Template:
   * VPC and Subnets:

     * Define a VPC with one public and one private subnet.
     * Attach an Internet Gateway to the VPC for public subnet access.
   * Security Groups:
   * Create a security group for the EC2 instance, allowing SSH and HTTP access from a specific IP range.
   * Create a security group for the RDS instance, allowing MySQL access from the EC2 instance only.
   * EC2 Instance:
   * Launch a t2.micro EC2 instance in the public subnet.
   * Configure the instance to access the S3 bucket and connect to the RDS instance.
   * S3 Bucket:
   * Create an S3 bucket for storing static assets or configuration files.
   * Ensure the EC2 instance has the necessary IAM role and permissions to access the S3 bucket.
   * RDS MySQL DB Instance:
   * Launch a t3.micro MySQL database in the private subnet.
   * Configure the security group to allow access only from the EC2 instance.
2. Deploy the Application:

* Deploy the CloudFormation stack using the template created.
* Verify that all components are correctly configured and operational.
* Ensure the EC2 instance can communicate with the RDS instance and access the S3 bucket.

1. Testing:

* Test the deployed application by accessing it via the EC2 instance's public IP or DNS.
* Verify the connectivity between the EC2 instance and the RDS instance.
* Confirm that the EC2 instance can read from and write to the S3 bucket.

1. Documentation:

* Document the entire process, including the design decisions, the CloudFormation template, and the testing steps.
* Include screenshots or logs demonstrating the successful deployment and testing of the application.

1. Resource Termination:

* Once the deployment and testing are complete, terminate all resources by deleting the CloudFormation stack.
* Ensure that no resources, such as EC2 instances, RDS instances, or S3 buckets, are left running.

To Achive the following task:

Open AWS console go to the CloudFormation service click on the create stack:

![1724128735522](images/Readme/1724128735522.png)

Select the options as shown in above:
Upload the template file in yaml or json format:

```
AWSTemplateFormatVersion: '2010-09-09'
Description: Deploy a multi-tier application with EC2 (Ubuntu), RDS, S3, and VPC without IAM roles in us-east-2
 
Parameters:
  VpcCIDR:
    Description: CIDR block for the VPC
    Type: String
    Default: "10.0.0.0/16"
 
  PublicSubnetCIDR1:
    Description: CIDR block for the first subnet
    Type: String
    Default: "10.0.1.0/24"
 
  PublicSubnetCIDR2:
    Description: CIDR block for the second subnet
    Type: String
    Default: "10.0.3.0/24"
 
  PrivateSubnetCIDR1:
    Description: CIDR block for the first private subnet
    Type: String
    Default: "10.0.2.0/24"
 
  PrivateSubnetCIDR2:
    Description: CIDR block for the second private subnet
    Type: String
    Default: "10.0.4.0/24"
 
  InstanceType:
    Description: EC2 instance type
    Type: String
    Default: t2.micro
 
  DBInstanceType:
    Description: RDS instance type
    Type: String
    Default: db.t3.micro
 
  AllowedIP:
    Description: IP range allowed for SSH access (CIDR notation)
    Type: String
    Default: "182.76.141.106/32"

 
Resources:
  # VPC
  MyVPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VpcCIDR
      Tags:
        - Key: Name
          Value: MyVPC
 
  # Public Subnet 1
  PublicSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref MyVPC
      CidrBlock: !Ref PublicSubnetCIDR1
      AvailabilityZone: !Select [0, !GetAZs '']
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: PublicSubnet1
 
  # Public Subnet 2
  PublicSubnet2:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref MyVPC
      CidrBlock: !Ref PublicSubnetCIDR2
      AvailabilityZone: !Select [1, !GetAZs '']
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: PublicSubnet2
 
  # Private Subnet 1
  PrivateSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref MyVPC
      CidrBlock: !Ref PrivateSubnetCIDR1
      AvailabilityZone: !Select [0, !GetAZs '']
      Tags:
        - Key: Name
          Value: PrivateSubnet1
 
  # Private Subnet 2
  PrivateSubnet2:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref MyVPC
      CidrBlock: !Ref PrivateSubnetCIDR2
      AvailabilityZone: !Select [1, !GetAZs '']
      Tags:
        - Key: Name
          Value: PrivateSubnet2
 
  # Internet Gateway
  MyInternetGateway:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: MyInternetGateway
 
  # Attach Internet Gateway to VPC
  VPCGatewayAttachment:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      VpcId: !Ref MyVPC
      InternetGatewayId: !Ref MyInternetGateway
 
  # Security Group for EC2
  EC2SecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      VpcId: !Ref MyVPC
      GroupDescription: Allow SSH and HTTP access
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 22
          ToPort: 22
          CidrIp: !Ref AllowedIP
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          CidrIp: 0.0.0.0/0
 
  # Security Group for RDS
  RDSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      VpcId: !Ref MyVPC
      GroupDescription: Allow MySQL access from EC2 only
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 3306
          ToPort: 3306
          SourceSecurityGroupId: !Ref EC2SecurityGroup
 
  # EC2 Instance
  MyEC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      InstanceType: !Ref InstanceType
      ImageId: ami-0ff591da048329e00  # Replace with the latest Ubuntu AMI ID for us-east-2
      SubnetId: !Ref PublicSubnet1
      SecurityGroupIds:
        - !Ref EC2SecurityGroup
      UserData:
        Fn::Base64: !Sub |
          #!/bin/bash
          apt-get update
          apt-get install -y awscli
          # Example of fetching a file from S3 bucket (replace 'my-application-bucket' with actual bucket name)
          aws s3 cp s3://my-application-bucket/config-file /path/to/config-file
 
  # S3 Bucket
  MyS3Bucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: manan-s3-bucket-1
 
  # RDS MySQL DB Instance
  MyRDSDBInstance:
    Type: AWS::RDS::DBInstance
    Properties:
      DBInstanceClass: !Ref DBInstanceType
      Engine: MySQL
      MasterUsername: admin
      MasterUserPassword: admin12345
      DBInstanceIdentifier: DBdatabase01
      AllocatedStorage: 20
      VPCSecurityGroups:
        - !Ref RDSecurityGroup
      DBSubnetGroupName: !Ref DBSubnetGroup
 
  # RDS DB Subnet Group
  DBSubnetGroup:
    Type: AWS::RDS::DBSubnetGroup
    Properties:
      DBSubnetGroupDescription: Subnet group for RDS
      SubnetIds:
        - !Ref PrivateSubnet1
        - !Ref PrivateSubnet2
 
Outputs:
  EC2InstancePublicIP:
    Description: Public IP of the EC2 instance
    Value: !GetAtt MyEC2Instance.PublicIp
 
  S3BucketName:
    Description: Name of the S3 bucket
    Value: !Ref MyS3Bucket
 
  RDSInstanceEndpoint:
    Description: Endpoint of the RDS instance
    Value: !GetAtt MyRDSDBInstance.Endpoint.Address
```

Now click on the next, Give the crediential like stack name, etc. then click on the submit button:


![1724128951742](images/Readme/1724128951742.png)![1724128958115](images/Readme/1724128958115.png)

Here in abive screenshort all the secvice mentioned in the assignment are created.

AWD:RDS:DBdatabase take time to build sucessfully.

Here is the database:
![1724129105546](images/Readme/1724129105546.png)

RDSsecurity group assi=ocated with the database.

![1724129140087](images/Readme/1724129140087.png)

Instance:
![1724129185895](images/Readme/1724129185895.png)

InternetGateways:

![1724129211526](images/Readme/1724129211526.png)

S3-Bucket:

![1724129245682](images/Readme/1724129245682.png)

VPC:

![1724129262521](images/Readme/1724129262521.png)![1724129283996](images/Readme/1724129283996.png)



PrivateSubnet1:

![1724129321411](images/Readme/1724129321411.png)

PrivateSubnet2:
![1724129343766](images/Readme/1724129343766.png)

PublicSubnet2:
![1724129378024](images/Readme/1724129378024.png)

Security Group assocaited with EC2:
![1724129417682](images/Readme/1724129417682.png)

Now here the deliverables for the assingnment.
