FROM ubuntu:17.04
MAINTAINER MikeHe <mike_hequan@163.com>

RUN echo " \
deb http://mirrors.aliyun.com/ubuntu/ zesty main restricted universe multiverse \
deb http://mirrors.aliyun.com/ubuntu/ zesty-security main restricted universe multiverse \
deb http://mirrors.aliyun.com/ubuntu/ zesty-updates main restricted universe multiverse \
deb http://mirrors.aliyun.com/ubuntu/ zesty-backports main restricted universe multiverse \
deb http://mirrors.aliyun.com/ubuntu/ zesty-proposed main restricted universe multiverse \
deb-src http://mirrors.aliyun.com/ubuntu/ zesty main restricted universe multiverse \
deb-src http://mirrors.aliyun.com/ubuntu/ zesty-security main restricted universe multiverse \
deb-src http://mirrors.aliyun.com/ubuntu/ zesty-updates main restricted universe multiverse \
deb-src http://mirrors.aliyun.com/ubuntu/ zesty-backports main restricted universe multiverse \
deb-src http://mirrors.aliyun.com/ubuntu/ zesty-proposed main restricted universe multiverse \
deb http://archive.canonical.com/ubuntu/ zesty partner \
deb http://extras.ubuntu.com/ubuntu/ zesty main \
" > /etc/apt/sources.list

RUN apt-get update -y && \
apt-get upgrade -y && \
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

# Clean OS
RUN apt-get clean all && \
rm -rf /tmp/*

# copy code
COPY ./ /root/

#ADD entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh

EXPOSE 2015

ENTRYPOINT ["/root/entrypoint.sh"]