from diagrams import Diagram
from diagrams.aws.compute import EC2
import json
import os
from pprint import pprint
## Opening the .tfstate file
with open('./tgw/terraform.tfstate') as json_file:
    tf_data = json.load(json_file)
pprint(tf_data)
r_names = []
## looping over the names
for x in tf_data['resources']:
    r_names.append(x['name'])
print("\nResources Name List: \n")
pprint(r_names)

