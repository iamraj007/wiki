# Wiki setup with autoamtion
Wiki setup with automation using IaC: terraform and  CM:Ansible 

## Repo structure 
The repository have 2 set code in diffrent folder. One for Anisble code and other for terrform code.


## How to run?
1 . First cd to terraform_iac folder which have terrafom code to setup infrastructure on AWS
$ cd terraform_iac

2. You should we seeing mutiple terrafom files, just initialiese and apply
$ terraform init 
$ terraform apply --auto-approve

![tf2](https://user-images.githubusercontent.com/47947075/114410967-6a5acf00-9bc9-11eb-844e-634f51cadb48.png)

3. Now that we have infrastructure up and running (after few minutes), we can start to provison our application.
$ cd ansible_cm
$ ansible-playbook -i ./ec2.py --limit IPDetails/tag wiki_remote_setup.yaml --extra-vars "target=IPDetails"  

![an1](https://user-images.githubusercontent.com/47947075/114409956-97f34880-9bc8-11eb-9bfa-3339d99888eb.png)

*This will take some time, after all roles are run you may access application.*

To get all instance in a LB, use below aws cli comamnd: 
aws elb describe-load-balancers --query LoadBalancerDescriptions[*].Instances --output text

## Pre requisite 
The controller node should have Ansible and terraform (>0.12) installed 
Boto and python library should be configured (for dynamic inv)
AWS CLI installed and AWS keys with valid privileges configured 



