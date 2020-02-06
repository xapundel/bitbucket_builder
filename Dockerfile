FROM atlassian/bitbucket-server:6.10.0-ubuntu-jdk11

ADD https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz /root
RUN /bin/tar zxf /root/mysql-connector-java-5.1.48.tar.gz --strip-components 1 -C /opt/atlassian/bitbucket/app/WEB-INF/lib mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar
