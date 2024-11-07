import json
from ctypes import c_int

with open('task.json', 'r') as file:
    data = json.load(file)

departments = data['store']['departments']
for department in departments:
    if department['name'] == "Electronics":
        for product in department['products']:
            print(f'id: {product['id']}')
            print(f'name: {product['name']}')
            print(f'brand: {product['brand']}')
            print(f'price: {product['price']}')
            print('Specifications: ')
            for specification in product['specifications'] :
                print(f'{specification}: {product['specifications'][specification]}')
            print('__________________________________')


