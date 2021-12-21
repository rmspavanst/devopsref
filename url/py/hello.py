#!/bin/python3
print("Hello, World!")

if 5 > 2:
  print("Five is greater than two!")


import json

# some JSON:
x = '{ "name":"John", "age":30, "city":"New York"}'

# parse x:
y = json.loads(x)

# the result is a Python dictionary:
print(y["age"])
print(y["name"])