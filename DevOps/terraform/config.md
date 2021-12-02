1. Download and intall terraform

terraform -v

2. Setup terraform for aws

> generate access key and secret key on aws iam and provide resources access for user
> Expose resources for specific infrastructure platform (ex: aws, azure, gcp,oci..)

>> for aws install AWS cli and configure..

aws --version
aws configure
    AWS Access Key ID : xxxxxx
    AWS Secret Access Key: XXXXXXXXX
    Default region name: eu-west-3
    Default output format: json
cat ~/.aws/config
cat ~/.aws/credentials


>> to check $aws configure list

cmds:--->
-------------
terraform init
terraform apply # Enter a value: yes
terraform destory -target aws_subnet.dev-subnet-2 # to destroy specific resource
terraform destroy # Enter a value: yes

# check currect state or desire state--
terraform plan
terraform apply -auto-approve
# state
terraform state ## it shows the subcomds
