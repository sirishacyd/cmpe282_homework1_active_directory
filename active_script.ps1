 # Import the ActiveDirectory module
Import-Module ActiveDirectory

# Define the path to the CSV file
$csvPath = "C:\Users\Admin\Desktop\users.csv"

# Read the CSV file and loop through each row
Import-Csv $csvPath | ForEach-Object {

    # Assign values to variables
    $firstName = $_.FirstName
    $lastName = $_.LastName
    $password = 'Test@1234'

    # Define the properties of the new user
    $userProperties = @{
        GivenName = $firstName
        Surname = $lastName
        Name = "$firstName $lastName"
        UserPrincipalName = "$firstname.$lastName"
        AccountPassword = (ConvertTo-SecureString $password -AsPlainText -Force)
        EmailAddress = "$firstname.$lastName@sirisha.com"
        Path = "OU=Users,OU=siri,DC=sirisha,DC=com" # Change this to the appropriate OU
        Enabled = $true
    }

    # Create the new user in Active Directory
    New-ADUser @userProperties
    echo "Added User to Group $firstName $LastName"
}
 
