# Use Amazon Linux 2 as the base image
FROM amazonlinux:2

# Set the working directory inside the container
WORKDIR /usr/local

# Install OpenJDK 17, curl, wget, and httpd (Apache HTTP Server)
RUN yum update -y && yum install -y \
    java-17-amazon-corretto-devel \
    curl \
    wget \
    tar \
    httpd \
    && yum clean all

# Expose HTTPD port
EXPOSE 80

# Set the command to start the Apache HTTP Server when the container starts
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


# pipeline {
#     agent {
#         label 'slave' // Ensure this matches the actual agent label or use 'any'
#     }

#     environment {
#         DOCKER_IMAGE = 'benjeo/httpd' // Image name
#     }

#     stages {
#         stage('Build Docker Image') {
#             steps {
#                 script {
#                     // Build Docker image from the Dockerfile
#                     docker.build(DOCKER_IMAGE) // You can specify the Dockerfile path if needed
#                 }
#             }
#         }

#         stage('Push to Docker Hub') {
#             steps {
#                 script {
#                     // Push Docker image to Docker Hub
#                     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
#                         docker.image(DOCKER_IMAGE).push()
#                     }
#                 }
#             }
#         }
#     }
# }

