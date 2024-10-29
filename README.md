# amd-sev-snp
Terraform to spin up an EC2 instance of SLES 15 sp6 with Confidential Compute enabled

## Installation
```
cd tf
terraform init

# run terraform plan until happy with what will be deployed..
terraform plan

# apply when ready
terraform apply -auto-approve

cd ..
```

## Check Encryption Active

ssh to the instance
```
# sudo  dmesg | grep -i sev-snp
[    6.328778] Memory Encryption Features active: AMD SEV SEV-ES SEV-SNP
```


