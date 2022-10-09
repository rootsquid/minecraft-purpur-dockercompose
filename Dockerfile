FROM openjdk:18-slim
WORKDIR /app/
COPY --from=python:3.8-slim-buster / /

ENV VERSIONPURPUR=1.19.2
ENV MEMORY=2G

#Copy & install requirements 
COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY serverdownloader.py /app/
COPY purpur.sh /app/

#Ports
EXPOSE 25565/tcp
EXPOSE 25565/udp

ENTRYPOINT ["/bin/sh", "purpur.sh"]
