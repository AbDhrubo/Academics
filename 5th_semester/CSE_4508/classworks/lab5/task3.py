import json
from ctypes import c_int

with open('task.json', 'r') as file:
    data = json.load(file)

departments = data['store']['departments']
for department in departments:
    # if department['name'] == "Electronics":
    for product in department['products']:
        if product['name'] == 'Wireless Mouse':
            print(f'id: {product['id']}')
            print(f'name: {product['name']}')
            print(f'brand: {product['brand']}')
            print(f'price: {product['price']}')
            # print(product['specifications'])
            print('Specifications: ')
            for specification in product['specifications']:
                # print(specification)
                print(f'{specification}: {product['specifications'][specification]}')
                # print(f'Processor: {specification['processor']}')
                # print(f'Memory: {specification['memory']}')
                # print(f'Storage: {specification['storage']}')