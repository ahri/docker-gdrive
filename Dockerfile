FROM ahri/base

VOLUME ["/gdrive/data"]

RUN curl -s https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | apt-key add - 
RUN echo 'deb http://apt.insynchq.com/ubuntu trusty non-free contrib' > /etc/apt/sources.list.d/insync.list
RUN apt-get update -qq && \
    apt-get -qqy install insync-headless sqlite3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/service/insync-headless
ADD insync-headless.sh /etc/service/insync-headless/run

ADD bootstrap.sh bootstrap.sh
ADD acct-setup.sh acct-setup.sh

ENTRYPOINT ["/bootstrap.sh"]
