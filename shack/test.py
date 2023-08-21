import json

# Assuming you have the JSON data as a list of dictionaries
data = [ ]
with open("test.json", "r") as file:
    data = json.load(file)

# Filter and display entries with "oculus" in platforms
filtered_results = [entry for entry in data if any(platform["platform"] == "oculus" for platform in entry["platforms"])]

# Print the filtered results
for entry in filtered_results:
    print(json.dumps(entry, indent=4))