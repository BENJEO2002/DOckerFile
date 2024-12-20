# Use Amazon Linux 2 as the base image
FROM amazonlinux:2

# Set the working directory inside the container
WORKDIR /usr/local

# Install OpenJDK 17, curl, and wget
RUN yum update -y && yum install -y \
    java-17-amazon-corretto-devel \
    curl \
    wget \
    tar \
    && yum clean all

# Download Tomcat and extract it
RUN curl -o apache-tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.10/bin/apache-tomcat-10.1.10.tar.gz \
    && tar -xzvf apache-tomcat.tar.gz -C /usr/local/ \
    && mv /usr/local/apache-tomcat-10.1.10 /usr/local/tomcat \
    && rm -f apache-tomcat.tar.gz

# Expose Tomcat port
EXPOSE 8080

# Set the environment variable for Tomcat home
ENV CATALINA_HOME=/usr/local/tomcat

# Set the command to run Tomcat when the container starts
CMD ["sh", "-c", "$CATALINA_HOME/bin/catalina.sh run"]
