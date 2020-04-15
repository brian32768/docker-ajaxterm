FROM debian:10.0
LABEL maintainer="Brian Wilson <brian@wildsong.biz>"
LABEL version="1.0"
LABEL biz.wildsong.name="mapproxy"

RUN apt-get update && apt-get install -y ajaxterm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8022
ENV TIMEZONE PDT

# Make it work from anywhere
WORKDIR /usr/share/ajaxterm/
RUN sed -i "s/'localhost'/'0.0.0.0'/g" ajaxterm.py

# CMD /usr/bin/ajaxterm -c "ssh ${USERNAME}@${SSHHOST}"

