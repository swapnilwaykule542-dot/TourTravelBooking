FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY mysql-connector-j-26.7.0.jar /usr/local/tomcat/lib/

COPY src/main/webapp /usr/local/tomcat/webapps/ROOT

COPY src/main/java /tmp/src

RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    && javac -cp "/usr/local/tomcat/lib/*" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    $(find /tmp/src -name "*.java")

EXPOSE 10000

CMD ["sh", "-c", "sed -i 's/8080/10000/g' /usr/local/tomcat/conf/server.xml && catalina.sh run"]