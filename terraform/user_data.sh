#!/bin/bash

yum update -y
yum install git java-21-amazon-corretto-devel -y

# Set required environment variables to build and run the app
export JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto
export PATH=$PATH:$JAVA_HOME/bin

cd /opt
git clone https://github.com/AK7Z/terraform-jpetstore.git && cd terraform-jpetstore

# We're running the app as root.
# This bad practise but we'll live with it for this use case.

# Build app
./mvnw clean package
# Run app 
./mvnw cargo:run -P tomcat90