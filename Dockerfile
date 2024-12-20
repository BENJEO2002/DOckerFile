# Use an official base image with Java installed
FROM openjdk:17-jdk-slim

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Specify the version of Tomcat
ARG TOMCAT_VERSION=10.1.10

# Download and unpack Tomcat
RUN apt-get update && apt-get install -y curl \
    && curl -fSL https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    | tar -xzC /usr/local/ \
    && mv /usr/local/apache-tomcat-${TOMCAT_VERSION} /usr/local/tomcat \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR $CATALINA_HOME

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
