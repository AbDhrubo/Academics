import json
from ctypes import c_int



with open('task.json', 'r') as file1:
    data1 = json.load(file1)

departments = data1['store']['departments']
for department in departments:
    # if department['name'] == "Electronics":
    for product in department['products']:
        if product['name'] == 'Smartphone':
            product['price'] = 749.99

with open("task.json", "w") as outfile:
    outfile.write(json.dumps(data1, indent=4))

with open('task.json', 'r') as file1:
    data2 = json.load(file1)

print(data2)
