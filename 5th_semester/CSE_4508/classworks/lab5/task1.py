import json
from ctypes import c_int

with open('task.json', 'r') as file:
    data = json.load(file)

# print(data)
name = data['store']['name']
location = data['store']['location']
city = location['city']


print(name)
print('location')
print(f'city: {city}')
print(f'street: {location['address']['street']}')
print(f'postal code: {location['address']['postalCode']}')
# for l in location:
#     for m in l:
#         print(f'{l} {location[l][m]}')