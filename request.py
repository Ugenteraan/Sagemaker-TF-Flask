#AWS CREDENTIAL SET UP IS IMPORTANT!

import boto3
import base64

#REPLACE THE VALUE OF THIS VARIABLE WITH YOUR SAGEMAKER ENDPOINT!
endpoint = 'YOUR SAGEMAKER ENDPOINT HERE'


runtime = boto3.Session().client('sagemaker-runtime')

with open('five.jpg', 'rb') as f:

    filebase64 = base64.b64encode(f.read()) #encode the image in base64 format.


# Send image via InvokeEndpoint API
response = runtime.invoke_endpoint(EndpointName=endpoint, ContentType='image/jpg', Body=filebase64)

# Unpack response
result = json.loads(response['Body'].read().decode())
print(result)
