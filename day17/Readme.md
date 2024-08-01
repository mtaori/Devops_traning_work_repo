**### Project 02:

Objective: Automate the setup of a multi-tier web application stack with separate database and application servers using Ansible.

### Problem Statement

Objective: Automate the deployment and configuration of a multi-tier web application stack consisting of:

1. Database Server: Set up a PostgreSQL database server on one Ubuntu instance.
2. Application Server: Set up a web server (e.g., Apache or Nginx) on another Ubuntu instance to host a web application.
3. Application Deployment: Ensure the web application is deployed on the application server and is configured to connect to the PostgreSQL database on the database server.
4. Configuration Management: Use Ansible to automate the configuration of both servers, including the initialization of the database and the deployment of the web application.

### Deliverables

1. Ansible Inventory File
   * Filename: inventory.ini
   * Content: Defines the database server and application server instances, including their IP addresses and connection details.
2. Ansible Playbook

* Filename: deploy\_multitier\_stack.yml
* Content: Automates:
* The deployment and configuration of the PostgreSQL database server.
* The setup and configuration of the web server.
* The deployment of the web application and its configuration to connect to the database.

1. Jinja2 Template

* Filename: templates/app\_config.php.j2
* Content: Defines a configuration file for the web application that includes placeholders for dynamic values such as database connection details.

1. Application Files

* Filename: files/index.html (or equivalent application files)

Content: Static or basic dynamic content served by the web application.**

Here is the playbook output screenshort:

![1722511529094](images/Readme/1722511529094.png)

![1722511540262](images/Readme/1722511540262.png)

here is the database made by ansible playbook in instance:

![1722511618281](images/Readme/1722511618281.png)

here is the script file:
![1722511659536](images/Readme/1722511659536.png)

**### Project 02:

Objective: Automate the setup of a multi-tier web application stack with separate database and application servers using Ansible.

### Problem Statement

Objective: Automate the deployment and configuration of a multi-tier web application stack consisting of:

1. Database Server: Set up a PostgreSQL database server on one Ubuntu instance.
2. Application Server: Set up a web server (e.g., Apache or Nginx) on another Ubuntu instance to host a web application.
3. Application Deployment: Ensure the web application is deployed on the application server and is configured to connect to the PostgreSQL database on the database server.
4. Configuration Management: Use Ansible to automate the configuration of both servers, including the initialization of the database and the deployment of the web application.

### Deliverables

1. Ansible Inventory File
   * Filename: inventory.ini
   * Content: Defines the database server and application server instances, including their IP addresses and connection details.
2. Ansible Playbook

* Filename: deploy\_multitier\_stack.yml
* Content: Automates:
* The deployment and configuration of the PostgreSQL database server.
* The setup and configuration of the web server.
* The deployment of the web application and its configuration to connect to the database.

1. Jinja2 Template

* Filename: templates/app\_config.php.j2
* Content: Defines a configuration file for the web application that includes placeholders for dynamic values such as database connection details.

1. Application Files

* Filename: files/index.html (or equivalent application files)
* Content: Static or basic dynamic content served by the web application.

**

Step1:

make an inventory.ini which containe information about instance's one opf them is application and othe is database.

Here we have to make 2 instance as per question.

Make sure before running the playbook check the connection of instance by ssh command:
ssh username@<instance_ip> -i <your_key.pem>

If it is sucessfull apply the ping command to check the ansible connection:

ansible -m ping -i inventory.ini application.
ansible -m ping -i inventory.ini database.


![1722512164288](images/Readme/1722512164288.png)

Step 2: 

Run the playbook:

![1722512203959](images/Readme/1722512203959.png)

![1722512221165](images/Readme/1722512221165.png)



if the playbook is sucessfull then ,

Step 3: Check the nginx status in the application instance:

sudo systemctl nginx status

![1722512354710](images/Readme/1722512354710.png)

if it is showing shatus active then nginx is install properly

Step 4:

Now go to the default directory of where nginx is installed and see the index.html output should be your html webapp.

![1722512527970](images/Readme/1722512527970.png)

Step 4:

Now use the curl command to check the url.
curl http://<your_instance_ip>

![1722512854592](images/Readme/1722512854592.png)

now go to the public id of instace paste in the browser:

![1722512960525](images/Readme/1722512960525.png)

in the default directory /var/www/html/ there is php file which which is build with the help of template used in playbook:

![1722513187970](images/Readme/1722513187970.png)

Step 6:

Go to the 2nd instance where the database is installed:

then type

mysql -u <user_name> -p

type you password that you have given.

![1722513451664](images/Readme/1722513451664.png)

Step 7: Check the database that you have made by this query
show databases;

![1722513529005](images/Readme/1722513529005.png)



if my database is show in the list the list the sucessfull.
