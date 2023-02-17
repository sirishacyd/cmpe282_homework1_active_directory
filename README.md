# cmpe282_homework1_active_directory
### Steps:
Step 1: set up AWS managed active directory on directory service.
```
- Input Directory DNS Name.
- Provide Admin Password for Active Directory.
- Select the VPC and host subnets in different availability zones.
 ```
 Step 2: Lanch EC2 instance with microsoft Os image
 ```
- Connect to Microsoft EC2 Instance.
- Set DNS address of Directory Service created in AWS, inside Internet Protocol(TCP/IPv4) Properties.
- Set the Domain name of Directory Service 
- Now we are connected to our created Active Directory i.e “cloud.activedir.com”
 ```
Step3: Import Users in AD from large dataset of (300K+ users)
```
Download data from large dataset (300K+ users)
- https://raw.githubusercontent.com/datacharmer/test_db/master/load_employees.dump
- Convert the data related to the attribute fields that need to be inserted into Active Directory into a CSV file.
- Then use a PowerShell script to add the user data one at a time to Active Directory
```

* Total Count of Users imported: 
 
