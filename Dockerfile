FROM debian:latest
EXPOSE 80
MAINTAINER PurpleFl00d
RUN apt update \
&& apt install -y tor nginx nano \
&& apt clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& mv /etc/tor/torrc /etc/tor/torrc.old \
&& echo "HiddenServiceDir /var/lib/tor/hidden_service/" > /etc/tor/torrc \
&& echo "HiddenServicePort 80 127.0.0.1:80" >> /etc/tor/torrc \
&& echo "HiddenServiceVersion 3" >> /etc/tor/torrc \
&& service tor restart \
&& service nginx start \




