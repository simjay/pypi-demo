FROM stevearc/pypicloud

RUN pip3 install pypicloud[dynamo]
RUN pip3 install uwsgi pastescript

# Copy config file to config directory 
COPY server.ini /etc/pypicloud/

# Expose service port
EXPOSE 8080

CMD ["uwsgi", "--ini-paste-logged", "/etc/pypicloud/server.ini"]