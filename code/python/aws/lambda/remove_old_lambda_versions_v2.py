# https://gist.github.com/tobywf/6eb494f4b46cef367540074512161334#gistcomment-3876956
# Remove Old Lambda Versions
from __future__ import absolute_import, print_function, unicode_literals
import boto3

NUM_VERSION = 5

def get_versions_function(client, function_name):
    versions = client.list_versions_by_function(FunctionName=function_name)

    while "NextMarker" in versions and versions["NextMarker"]:
        tmp = client.list_versions_by_function(
            FunctionName=function_name,
            Marker=versions["NextMarker"])
        versions['Versions'].extend(tmp['Versions'])
        versions["NextMarker"] = tmp["NextMarker"] if "NextMarker" in tmp else None

    return versions['Versions']


def get_functions(client):
    functions = client.list_functions()

    while "NextMarker" in functions and functions["NextMarker"]:
        tmp = client.list_functions(
            Marker=functions["NextMarker"])
        functions['Functions'].extend(tmp['Functions'])
        functions["NextMarker"] = tmp["NextMarker"] if "NextMarker" in tmp else None

    return functions['Functions']


def clean_old_lambda_versions(client):
    functions = get_functions(client)

    for function in functions:
        versions = get_versions_function(client, function['FunctionArn'])
        numVersions = len(versions)
        aliases = client.list_aliases(FunctionName=function['FunctionArn'])
        alias_versions = [alias['FunctionVersion'] for alias in aliases['Aliases']]

        if numVersions <= NUM_VERSION:
            print('{}: done'.format(function['FunctionName']))
        else:
            for version in versions:
                if (version['Version'] != function['Version'] 
                        and numVersions > NUM_VERSION
                        and not version['Version'] in alias_versions):

                    arn = version['FunctionArn']
                    print('delete_function(FunctionName={})'.format(arn))
                    client.delete_function(FunctionName=arn)  # uncomment me once you've checke
                    numVersions -= 1


session = boto3.session.Session(profile_name='default')
regions = ['ap-southeast-1']

for region in regions:
    client = session.client('lambda', region_name=region)
    clean_old_lambda_versions(client)
