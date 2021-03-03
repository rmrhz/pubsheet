# https://vipmunot.medium.com/how-to-remove-older-versions-of-lambda-a4415f11a2da
import json
import boto3
from collections import Counter

def lambda_handler(event, context):
  client = boto3.client('lambda')
  response = client.list_functions(FunctionVersion='ALL')
  
  d = dict(Counter([x['FunctionName'] for x in response['Functions']]))
  print(json.dumps(d, indent=2))
  
  for key, value in d.items():
    if value > 5:
      print(key, '->', value) 
      a = {}
      
      for x in response['Functions']:
        if x['FunctionName'] == key and x['Version'] != '$LATEST':
          #print(x['FunctionArn'],x['LastModified'])
          a[x['FunctionArn']] = x['LastModified']
          listofTuples = sorted(a.items() , key=lambda x: x[1])
          print(a)
          print(json.dumps(listofTuples))
        
        if len(listofTuples) > 5:
          for elem in listofTuples[0:len(listofTuples)-5]:
            response = client.delete_function(FunctionName=elem[0])
            print("FunctionArn",elem[0],"Deleted response",response,sep = "->")