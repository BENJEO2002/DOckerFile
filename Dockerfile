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
