import getpass
import json
import re
import requests
import warnings
import sys

warnings.simplefilter('ignore') # Because I am using unverified ssl certificates 
# Connect to cbigr vm and get token
baseurl = 'https://cbigr-dev.loris.ca/api/v0.0.3-dev/'
payload = {
    'username': 'krishna', 
    'password': 'demo20!9'
}
response = requests.post(url = baseurl + '/login',
                         json=payload,
                         verify=False)

text = response.content.decode('ascii')
data = json.loads(text)
token = data['token']

# Get candidate arguments
dob = sys.argv[1]
sex = sys.argv[2]
site = "Clinical Research Unit"
edc = sys.argv[3]
project = sys.argv[4]
pscid = sys.argv[5]

print(dob)
print(sex)
print(site)
print(edc)
print(project)
print(pscid)

# Prepare TOSI CBIGR Candidate JSON
pscid = 'CRU0001'
json_data = {
    "Candidate" : {
        "Project" : project,
        "PSCID"   : pscid,
        "EDC"     : edc,
        "DoB"     : dob,
        "Sex"     : sex,
        "Site"    : site,
    }
}

print(json_data)

r = requests.post(
    url ='https://cbigr-dev.loris.ca/api/v0.0.3-dev/candidates/',
    json = json_data,
    verify = False,
    headers = {'Authorization': 'Bearer %s' % token}
)

json.loads(r.content.decode("ascii"))

print(r)
print(r.content.decode("ascii"))
