FROM debian:latest

RUN apt update && apt upgrade -y --force-yes

RUN apt install -y curl wget git clamav dnsutils
RUN git clone https://github.com/extremeshok/clamav-unofficial-sigs.git /opt/clamav-unofficial-sigs
RUN chmod 0755 /opt/clamav-unofficial-sigs/clamav-unofficial-sigs.sh
RUN cp -r /opt/clamav-unofficial-sigs/config /etc/clamav-unofficial-sigs/
RUN mv /etc/clamav-unofficial-sigs/os.debian8.conf /etc/clamav-unofficial-sigs/os.conf
RUN echo 'user_configuration_complete="yes"' >> /etc/clamav-unofficial-sigs/user.conf

COPY scan /scan
RUN chmod +x /scan
ENTRYPOINT /scan
