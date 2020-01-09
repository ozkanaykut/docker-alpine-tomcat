FROM alpine:latest

MAINTAINER AYKUT OZKAN <aykuttozkan@gmail.com>

# Update system
#RUN ["apk", "update"]

# install openjdk8
RUN ["apk", "add", "openjdk8"]

# install nano and tar program
RUN ["apk", "add", "nano", "tar"]

# default path
ARG USR_LCL_DIR=/usr/local
#ENV USR_LCL_DIR /usr/local

# set workdir path value = /usr/local
WORKDIR $USR_LCL_DIR

# copy all files of "tomcat"
ADD ["./tomcat" ,"./tomcat"]

# set environment default values
ENV CATALINA_BASE=$USR_LCL_DIR/tomcat \
	CATALINA_HOME=$USR_LCL_DIR/tomcat \
	CATALINA_TMPDIR=$USR_LCL_DIR/tomcat/temp \
	JRE_HOME=/usr \
	CLASSPATH=$USR_LCL_DIR/tomcat/bin/bootstrap.jar:$USR_LCL_DIR/tomcat/bin/tomcat-juli.jar \
	TOMCAT=$USR_LCL_DIR/tomcat/webapps

# custom notification
RUN ["/bin/echo", "catalina.sh servisi baslatiliyor"]

# set workdir path value = /usr/local/tomcat/bin
WORKDIR $USR_LCL_DIR/tomcat/bin

# publish 8080 port
EXPOSE 8080

# running cataline.sh
# #CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
CMD ["sh","catalina.sh", "run"]
# #CMD ["/bin/sh"]

#WORKDIR /usr/local/tomcat/bin
