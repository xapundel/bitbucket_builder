FROM atlassian/bitbucket-server:7.12.1-jdk11

ADD https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz /root
RUN /bin/tar zxf /root/mysql-connector-java-5.1.48.tar.gz --strip-components 1 -C /opt/atlassian/bitbucket/app/WEB-INF/lib mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar

ADD files/dc01-ca.crt /opt/
RUN /opt/java/openjdk/bin/keytool -import \
  -alias dc01 \
  -keystore /opt/java/openjdk/lib/security/cacerts \
  -storepass changeit \
  -noprompt \
  -file /opt/dc01-ca.crt
  