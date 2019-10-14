FROM ubuntu:18.04
LABEL maintainer="tarlety@gmail.com"

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y docker.io \
 && apt-get install -y net-tools moreutils jq \
 && apt-get install -y unattended-upgrades \
 && apt-get install -y tmux curl wget sudo

RUN echo 'postfix postfix/relayhost string "smtp.localhost"' | debconf-set-selections
RUN echo 'postfix postfix/mailname string "localhost"' | debconf-set-selections
RUN echo 'postfix postfix/main_mailer_type string "Local only"' | debconf-set-selections
RUN apt-get install -y logwatch

RUN apt-get install -y openssh-server
RUN sed -i -e 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#PubkeyAuthentication yes/AuthenticationMethods publickey\nPubkeyAuthentication yes/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#HostbasedAuthentication no/HostbasedAuthentication no/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#IgnoreUserKnownHosts no/IgnoreUserKnownHosts no/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#IgnoreRhosts yes/IgnoreRhosts yes/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#PermitEmptyPasswords no/PermitEmptyPasswords no/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#ClientAliveInterval 0/ClientAliveInterval 3600/' /etc/ssh/sshd_config;
RUN sed -i -e 's/^#ClientAliveCountMax 3/ClientAliveCountMax 0/' /etc/ssh/sshd_config;

RUN useradd -ms /bin/bash me
RUN usermod -aG sudo me
RUN echo "me ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/me
USER me

RUN mkdir -p /home/me/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

