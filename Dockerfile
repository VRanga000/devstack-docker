#Dockerfile to build devstack
# app:latest
FROM ubuntu:utopic
MAINTAINER Vikas Rangarajan <vikas_rangarajan@cable.comcast.com>

RUN apt-get update
RUN apt-get install sudo
RUN useradd -m -s /bin/bash stack
ADD sudoers.stack /etc/sudoers.d/stack
RUN chmod 0440 /etc/sudoers.d/stack
ADD setup.sh /home/stack/setup.sh
RUN chmod 755 /home/stack/setup.sh
RUN su -l stack ./setup.sh
ADD local.conf /home/stack/devstack/local.conf

USER stack
ENV FORCE yes 
CMD cd ~/devstack && ./stack.sh || sudo service mysql start && ./stack.sh && tail -F /opt/stack/logs/stack.sh.log
