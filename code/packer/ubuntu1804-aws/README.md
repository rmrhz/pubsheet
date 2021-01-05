# Ubuntu 18.04 AWS AMI Base
Creates a base image with the following packages

* AWS CodeDeploy Agent
* AWS CloudWatch Agent
* Certbot
* Nginx
* Ruby
* Python

### Prerequisites
* Packer >v1.6.4 (HCL)
* Ansible >v2.0
* [IAM Policy](aws/iam/policies/packer.json)
