FROM ubuntu:17.04
MAINTAINER MikeHe <mike_hequan@163.com>

RUN apt-get update -y && \
apt-get install -y php7.0-fpm \
php7.0-cli \
php7.0-common \
php7.0-mbstring \
php7.0-gd \
php7.0-intl \
php7.0-xml \
php7.0-mysql \
php7.0-mcrypt \
php7.0-zip

# install ttyd
RUN apt-get install -y cmake g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev && \
cd /root  && \
git clone https://github.com/tsl0922/ttyd.git && \
cd ttyd && mkdir build && cd build && \
cmake .. && \
make && make install

# Clean OS
RUN apt-get clean all && \
rm -rf /tmp/* /root/ttyd

# copy code
COPY ./ /root/

#ADD entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh

EXPOSE 7681

ENTRYPOINT ["/root/entrypoint.sh"]