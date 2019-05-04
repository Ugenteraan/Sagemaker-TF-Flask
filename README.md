# Sagemaker-Tensorflow-Flask
An example of a trained tensorflow model to be deployed in Sagemaker. Flask is used as web framework.

Steps:
1. Build the image using the Dockerfile provided. 
    ```sh
    docker build -t sagemaker:latest .
    ```
2. Create an AWS ECR repository and follow the push commands given to tag and push the built image to the ECR repository.
3. Create a model in AWS Sagemaker and provide the ECR repository's URI.
4. Create an endpoint for the model.
5. The NAME of the endpoint (not the URL) should be used to replace the value of the variable in **line 7** of [request.py](https://github.com/Ugenteraan/Sagemaker-TF-Flask/blob/master/request.py)
6. Run [request.py](https://github.com/Ugenteraan/Sagemaker-TF-Flask/blob/master/request.py) after the model is created in Sagemaker to verify the deployment.

License
----

MIT
