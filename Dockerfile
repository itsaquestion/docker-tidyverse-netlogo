FROM imtass/tidyverse-oracle-jdk8:latest

ENV NETLOGO_VERSION=6.0.4
ENV NETLOGO_HOME=/opt/NetLogo\ $NETLOGO_VERSION/app

RUN wget https://ccl.northwestern.edu/netlogo/${NETLOGO_VERSION}/NetLogo-${NETLOGO_VERSION}-64.tgz && \
    tar -zxvf NetLogo-${NETLOGO_VERSION}-64.tgz -C /opt && \
    rm NetLogo-${NETLOGO_VERSION}-64.tgz

RUN apt-get update && \
    apt-get install libxtst6 -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN R -e 'install.packages("RNetLogo")'

