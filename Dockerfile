FROM ubuntu:12.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install wget ca-certificates

RUN apt-get -y install ocaml libgtk2.0-dev
RUN cd /tmp && wget -q https://github.com/facebook/pfff/archive/v0.27.3.tar.gz && tar zxvf v0.27.3.tar.gz
RUN cd /tmp/pfff-0.27.3 && ./configure --novisual && make depend && make install
RUN cd /tmp && rm -rf pfff-0.27.3/ v0.27.3.tar.gz camlobj*

RUN apt-get -y install php5-cli
RUN wget -qO /usr/local/bin/phpmd http://static.phpmd.org/php/1.5.0/phpmd.phar && chmod +x /usr/local/bin/phpmd
ENV HOME /root
WORKDIR /root

RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:mapnik/boost
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu precise main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get -y update
RUN apt-get -y install hhvm
RUN wget -qO /usr/local/bin/hhvm-wrapper https://phar.phpunit.de/hhvm-wrapper.phar && chmod +x /usr/local/bin/hhvm-wrapper
