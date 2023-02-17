# Import active directory module for running AD cmdlets
Import-Module activedirectory
  
#Store the data from ADUsers.csv in the $ADUsers variable
$ADUsers = Import-csv C:\Users\admin\Desktop\employees.csv

#Loop through each row containing user details in the CSV file 
foreach ($User in $ADUsers)
{
	#Read user data from each field in each row and assign the data to a variable as below
		
	$Username 	= $User.AccountName
	$Password 	= $User.password
	$Firstname 	= $User.FirstName
    $DisplayName= $User.displayName
	$Lastname 	= $User.Lastname
	$OU 		= $User.ou #This field refers to the OU the user account is to be created in
    $email      = $User.email
    $description= $User.description
    $groups     = $User.groups


	#Check to see if the user already exists in AD
	if (Get-ADUser -F {SamAccountName -eq $Username})
	{
		 #If user does exist, give a warning
		 Write-Warning "A user account with username $Username already exist in Active Directory."
	}
	else
	{
		#User does not exist then proceed to create the new user account
		
        #Account will be created in the OU provided by the $OU variable read from the CSV file
		New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName $email `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -DisplayName "$Lastname, $Firstname" `
            -Path $OU `
            -Description $description `
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $False
	}
}