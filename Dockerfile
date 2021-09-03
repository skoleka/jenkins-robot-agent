FROM jenkins/agent


ENV CHROMIUM_VERSION 86.0
ENV FIREFOX_VERSION 78
ENV XVFB_VERSION 1.20



USER root


RUN apt-get update

USER jenkins
WORKDIR /home/jenkins
