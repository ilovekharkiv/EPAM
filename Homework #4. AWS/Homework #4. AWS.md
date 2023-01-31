### http://abolmasovp.click/ - static website
---

#### 1. Read the terms of Using the AWS Free Tier and the ability to control their own costs.

- [x] [Billing Free Tier](https://docs.aws.amazon.com/en_us/awsaccountbilling/latest/aboutv2/billing-free-tier.html) - my free tier is actually has come to an end, my AWS account is about 1+ year old.

#### 2. Register with AWS (first priority) or alternatively, you can request access to courses in AWS Academy if you are currently a student of certain University.

![](/Screenshots/aws_1.png "aws_1")

- [x] Done

#### 3. Find the hands-on tutorials and AWS Well-Architected Labs for your AWS needs. Explore list of step-by-step tutorials for deferent category. Use, repeat as many as you can and have fun))

- [x] [Hands-on Tutorials AWS](https://aws.amazon.com/ru/getting-started/hands-on/?awsf.getting-started-category=category%23compute&awsf.getting-started-content-type=content-type%23hands-on&?e=gs2020&p=gsrc&awsf.getting-started-level=*all&getting-started-all.sort-by=item.additionalFields.sortOrder&getting-started-all.sort-order=asc) - learn various tutorials when i have free time

- [x] [AWS Well-Architected Labs](https://www.wellarchitectedlabs.com/) - learn various tutorials when i have free time

#### 4. Register and pass courses on AWS Educate. Filter by checking Topic Cloud Computing and Foundational Level. Feel free to pass more.

- [x] [AWS Educate](https://www.awseducate.com/student/s/) - learn various tutorials when i have free time

#### 5. Register and pass free courses on AWS Skillbuilder. AWS Cloud Practitioner Essentials: Core Services, AWS Cloud Practitioner Essentials: Cloud Сoncepts. Try AWS Cloud Quest: Cloud Practitioner.

- [x] [AWS Skillbuilder](https://skillbuilder.aws/) - learn various courses when i have free time. This platform i like the most.

![](/Screenshots/aws_2.png "aws_2")

#### 6. Pass Free courses on Amazon qwiklabs

- [x] [Amazon Qwiklabs](https://amazon.qwiklabs.com/) - taking labs when i have free time, but i mostly prefer learning on AWS Services directly :)

#### 7. Review Getting Started with Amazon EC2. Log Into Your AWS Account, Launch, Configure, Connect and Terminate Your Instance. Do not use Amazon Lightsail. It is recommended to use the t2 or t3.micro instance and the CentOS operating system.

Screenshot below shows the instance settings/state/address/etc, it also show that i succesfully logged in with my private key via ssh. 

First one is Amazon Linux

![](/Screenshots/aws_3.png "aws_3")

Second is RHEL

![](/Screenshots/aws_4.png "aws_4")


#### 8. Create a snapshot of your instance to keep as a backup.

![](/Screenshots/aws_5.png "aws_5")

#### 9. Create and attach a Disk_D (EBS) to your instance to add more storage space. Create and save some file on Disk_D.

![](/Screenshots/aws_6.png "aws_6")

![](/Screenshots/aws_7.png "aws_7")

![](/Screenshots/aws_8.png "aws_8")

#### 10. Launch the second instance from backup.

Requesting a new image creation from my snapshot

![](/Screenshots/aws_9.png "aws_9")

Launching the instance from my image

![](/Screenshots/aws_10.png "aws_10")

![](/Screenshots/aws_11.png "aws_11")

#### 11. Detach Disk_D from the 1st instance and attach disk_D to the new instance.

![](/Screenshots/aws_12.png "aws_12")

![](/Screenshots/aws_13.png "aws_13")

![](/Screenshots/aws_14.png "aws_14")

#### 12. Review the 10-minute example. Explore the possibilities of creating your own domain and domain name for your site. Note, that Route 53 not free service. Alternatively you can free register the domain name *.PP.UA and use it

- [x] [Video Example](https://aws.amazon.com/getting-started/hands-on/get-a-domain/?nc1=h_ls) - I'll use Route53 further below

### 13. Launch and configure a WordPress instance with Amazon Lightsail link

- [x] [Lightsail](https://lightsail.aws.amazon.com/)

![](/Screenshots/aws_15.png "aws_15")

![](/Screenshots/aws_16.png "aws_16")

#### 14. Review the 10-minute Store and Retrieve a File. Repeat, creating your own repository.

- [x] [Store and Retrieve](https://aws.amazon.com/ru/getting-started/hands-on/backup-files-to-amazon-s3/)

- [x] Create repo + Upload

![](/Screenshots/aws_17.png "aws_17")

- [x] Download

![](/Screenshots/aws_18.png "aws_18")

#### 15. Review the 10-minute example Batch upload files to the cloud to Amazon S3 using the AWS CLI. Create a user AWS IAM, configure CLI AWS and upload any files to S3.

- [x] [Batch upload](https://aws.amazon.com/getting-started/hands-on/backup-to-s3-cli/?nc1=h_ls)

- [x] IAM user is created with the S3 bucket full access policies

![](/Screenshots/aws_19.png "aws_19")

- [x] AWS CLI is configured

![](/Screenshots/aws_20.png "aws_20")

Let's upload a couple of files

![](/Screenshots/aws_21.png "aws_21")
![](/Screenshots/aws_22.png "aws_22")

Let's delete the files

![](/Screenshots/aws_23.png "aws_23")

#### 16. Review the 10-minute example Deploy Docker Containers on Amazon Elastic Container Service (Amazon ECS). Repeat, create a cluster, and run the online demo application or better other application with custom settings.

- [x] I used Fargate Sample App. Unfortunately, guide that was provided by our lecturer is currently irrelevant. AWS has already updated the deployment.

![](/Screenshots/aws_24.png "aws_24")

- [x] I also used EC2 + Docker to run an image and push it to ECR for testing purposes

![](/Screenshots/aws_25.png "aws_25")
![](/Screenshots/aws_27.png "aws_27")

- [x] Launched the container via Amazon ECS using my image that i pushed in a previous step

![](/Screenshots/aws_28.png "aws_28")

#### 17. Run a Serverless "Hello, World!" with AWS Lambda.

![](/Screenshots/lambda_1.png "lambda_1") 

#### 18. Create a static website on Amazon S3, publicly available (link1 or link2 - using a custom domain registered with Route 53).Post on the page your own photo, the name of the educational program (EPAM Cloud&DevOps Fundamentals Autumn 2022), the list of AWS services with which the student worked within the educational program or earlier and the full list with links of completed labs (based on tutorials or qwiklabs). Provide the link to the website in your report and СV.

## http://abolmasovp.click/


