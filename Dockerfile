FROM jenkins/agent


ENV CHROMIUM_VERSION 86.0
ENV FIREFOX_VERSION 78
ENV XVFB_VERSION 1.20



USER root


RUN apt-get update

#install python
RUN apt-get install --yes \
    python3 \
    pip


#install pip packages from requirements
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#install xvfb to operate on virtual X desktop
RUN apt-get -y install xvfb


#install Firefox
#RUN apt-get remove iceweasel \
#  && apt-get -y install apt-transport-https ca-certificates \
#  && echo '\ndeb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main' | tee -a /etc/apt/sources.list > /dev/null \
#  && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29 \
#  && apt-get update \
#  && apt-get install firefox-mozilla-build \
#  && apt-get install -y libdbus-glib-1-2 \
#  && apt-get install -y libgtk2.0-0 \
#  && apt-get install -y libasound2

RUN \
  apt-get install -y unzip libxi6 libgconf-2-4

#install chrome
#RUN apt-get install -y wget \
#  && apt -y --fix-broken install \
#  && apt-get -y install libxss1 libappindicator1 libindicator7 \
#  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#  && dpkg -i google-chrome*.deb; exit 0


RUN mkdir -p /opt/robot/tests/
RUN mkdir -p /opt/robot/reports/
RUN mkdir -p /opt/robot/exampletestcase/
RUN chmod -R 777 /opt/robot/
COPY ./exampletestcase/example.robot /opt/robot/exampletestcase/example.robot







USER jenkins