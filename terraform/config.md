cmds:
-------------
terraform init
terraform apply # Enter a value: yes
terraform destory -target aws_subnet.dev-subnet-2 # to destroy specific resource
terraform destroy # Enter a value: yes

# check currect state or desire state
terraform plan
terraform apply -auto-approve

# state
terraform state ## it shows the subcomds
