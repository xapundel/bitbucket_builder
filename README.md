# Bitbucket-builder

## Overview

This is a Dockerfile used to build a Bitbucket image that contains the MySQL JDBC connector.  

Change the Dockerfile for the atlassian image to be pulled. 

Note that the Atlassian documentation is currently incorrect for the location to put the jdbc driver.  

Their documentation indicates: /opt/atlassian/bitbucket/lib  

The correct location is: /opt/atlassian/bitbucket/app/WEB-INF/lib   

Check the Dockerfile to make sure you are building the correct version

## Usage

docker build -t concentricsky/atlassian:bitbucket_6.10.1_ubuntu_jdk11 .
docker push concentricsky/atlassian:bitbucket_6.10.1_ubuntu_jdk11
