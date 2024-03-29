FROM ubuntu:22.04
LABEL maintainer="tarlety@gmail.com"

# Install system packages

RUN apt-get update -y

RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get upgrade -y
RUN yes | unminimize
RUN apt-get install -y curl wget sudo apt-utils
RUN apt-get install -y moreutils jq
RUN apt-get install -y net-tools iproute2 iputils-ping
RUN apt-get install -y tmux zsh vim git
RUN apt-get install -y asciinema
RUN apt-get install -y zsh-theme-powerlevel9k powerline fonts-powerline
RUN apt-get install -y autojump fzf zsh-autosuggestions zsh-syntax-highlighting

RUN echo 'postfix postfix/relayhost string "smtp.localhost"' | debconf-set-selections
RUN echo 'postfix postfix/mailname string "localhost"' | debconf-set-selections
RUN echo 'postfix postfix/main_mailer_type string "Local only"' | debconf-set-selections
RUN apt-get install -y logwatch unattended-upgrades

# set locale to en_US.UTF-8

RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8

# Install sshd

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

RUN mkdir /var/run/sshd

# Setup user 'me'

RUN useradd -ms /bin/bash me
RUN chsh me -s /usr/bin/zsh

# Environment for user 'me'

USER me
RUN mkdir -p /home/me/.ssh
RUN mkdir -p /home/me/store

# Run sshd as root

USER root
EXPOSE 22
VOLUME /data
VOLUME /opt
VOLUME /home/me/store
CMD ["/usr/sbin/sshd", "-D"]
