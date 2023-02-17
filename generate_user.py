from faker import Faker
import csv

# Initialize Faker with the desired locale
fake = Faker('en_US')

# Open a new CSV file for writing
with open('names.csv', 'w', newline='') as file:

    # Create a CSV writer object
    writer = csv.writer(file)

    # Write a header row
    writer.writerow(['FirstName', 'LastName'])

    # Generate 300,000 names and write them to the CSV file
    for i in range(300000):
        first_name = fake.first_name()
        last_name = fake.last_name()
        writer.writerow([first_name, last_name])
