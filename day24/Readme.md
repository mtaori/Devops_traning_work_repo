#### Comprehensive AWS S3 Management and Static Website Hosting

#### Objective:

To test your knowledge and skills in managing AWS S3 storage classes, lifecycle management, bucket policies, access control lists (ACLs), and hosting a static website on S3. You will apply their understanding in a practical scenario, ensuring you have mastered the critical aspects of AWS S3.

#### Project Scenario:

You are tasked with creating and managing an S3 bucket for a fictional company, "TechVista Inc.," that hosts a static website for displaying their product portfolio. The website will have different types of content, including high-resolution images, which require careful storage management to optimize costs. Additionally, the company has strict security requirements for accessing the content.

#### Project Steps and Deliverables:

1. Create and Configure an S3 Bucket:
   * Create an S3 bucket named techvista-portfolio-[your-initials].
   * Enable versioning on the bucket.
   * Set up the bucket for static website hosting.
   * Upload the provided static website files (HTML, CSS, images).
   * Ensure the website is accessible via the S3 website URL.
2. Implement S3 Storage Classes:

* Classify the uploaded content into different S3 storage classes (e.g., Standard, Intelligent-Tiering, Glacier).
* Justify your choice of storage class for each type of content (e.g., HTML/CSS files vs. images).


3. Lifecycle Management:

* Create a lifecycle policy that transitions older versions of objects to a more cost-effective storage class (e.g., Standard to Glacier).
* Set up a policy to delete non-current versions of objects after 90 days.
* Verify that the lifecycle rules are correctly applied.

![1723547479467](images/Readme/1723547479467.png)

![1723547496941](images/Readme/1723547496941.png)

![1723547509261](images/Readme/1723547509261.png)

![1723547521117](images/Readme/1723547521117.png)


4. Configure Bucket Policies and ACLs:


* Create and attach a bucket policy that allows read access to everyone for the static website content.
* Restrict access to the S3 management console for specific IAM users using the bucket policy.
* Set up an ACL to allow a specific external user access to only a particular folder within the bucket.

![1723547138116](images/Readme/1723547138116.png)

5. Test and Validate the Configuration:

* Test the static website URL to ensure it is accessible.
* Validate the storage class transitions based on the lifecycle policy.
* Check the effectiveness of the bucket policy and ACLs by simulating different access scenarios (e.g., accessing the content with an external user, denying access from unauthorized users).


Now go to the Static website hosting and click on the link present in the Busket website hosting.

http://techvista-portfolio-manan.s3-website-ap-southeast-2.amazonaws.com

![1723547204031](images/Readme/1723547204031.png)

#### To achive the above task:

Step 1:
Remember when you creaet the bucket ublock all public access and enable versoning.

Create a s3 bucket:  techvista-portfolio-[your-initials].

![1723544423599](images/Readme/1723544423599.png)

Create the static web app and upload in the s3 bucket:

![1723544475153](images/Readme/1723544475153.png)

Now go to the properties section and enable ststic website hosting:
![1723544617346](images/Readme/1723544617346.png)
Go to Permission section and permission

```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Principal": "*",
			"Effect": "Allow",
			"Action": "s3:GetObject",
			"Resource" : "arn:aws:s3:::augustdemobucket24/*"
		}
	]
}

```
