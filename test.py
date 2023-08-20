import json

# Load JSON data from file
with open('api0.dump', 'r') as json_file:
    json_data = json_file.read()

# Print the loaded JSON data
print(json_data)
