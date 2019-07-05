	FROM ubuntu

	RUN apt-get update -y
	RUN apt-get install maven -y
	RUN apt-get install wget -y
	RUN apt-get install default-jdk -y

	RUN wget -P /opt/ http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz
	RUN tar xvf /opt/apache-tomcat-7.0.61.tar.gz -C /opt/
	RUN ln -s /opt/apache-tomcat-7.0.61 /usr/share/tomcat
	COPY tomcat-users.xml /usr/share/tomcat/conf
	RUN mkdir /webapps
	COPY . /webapps
	RUN cd webapps;mvn clean install
  
	CMD /opt/apache-tomcat-7.0.61/bin/startup.sh && tail -f /usr/share/tomcat/logs/catalina.ou
