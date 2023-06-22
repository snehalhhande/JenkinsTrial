FROM ubuntu

# Install dependencies
RUN apt update
RUN apt -y install apache2

# Install apache and write hello world message
RUN echo 'Hello World!' > /var/www/html/index.html

# Configure apache
# moves env variables of apache into run_apache.sh 
#created new file
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh
# added data to existing file
RUN echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh
RUN echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh
#run apache in foreground(processes that reqiuire a user to start)
RUN echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh
#gives all permission to owner, read & execute permissions to members and others
RUN chmod 755 /root/run_apache.sh 
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD /root/run_apache.sh