FROM jenkins/agent

ENV CHROMIUM_VERSION 86.0
ENV FIREFOX_VERSION 78
ENV XVFB_VERSION 1.20



USER root

RUN apt-get update
RUN apt-get install --yes \
    python 3.9 \
    # Install dependencies for cryptography due to https://github.com/pyca/cryptography/issues/5771
    cargo \
#    rust \

    # Continue with system dependencies
    gcc \
    g++ \
    libffi-dev \
#    linux-headers \
    make \
    musl-dev \
#    openssl-dev \
#    which \
    wget

RUN apt-get install --yes  \
    "chromium~$CHROMIUM_VERSION" \
    "chromium-chromedriver~$CHROMIUM_VERSION" \
    "firefox-esr~$FIREFOX_VERSION" \
    nodejs \
    nodejs-npm \
    xauth \
    tzdata \
    "xvfb-run~$XVFB_VERSION" \

RUN mv /usr/lib/chromium/chrome /usr/lib/chromium/chrome-original \
RUN ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib/chromium/chrome \


USER jenkins