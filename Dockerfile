FROM fedora:24

MAINTAINER Marcus Krause <marcus#exp2016@t3sec.info>

USER root

ENV HOME /root

RUN dnf -y update;  dnf -y install \
        php-cli \
        php-xml \
        php-pecl-gearman \
        git \
        supervisor \
        unzip; \
    dnf clean all
ADD ./timezone.ini /etc/php.d/timezone.ini

ADD ./install-composer.sh /tmp/install-composer.sh
RUN chmod +x /tmp/install-composer.sh
RUN /tmp/install-composer.sh

ADD ./install-sourcecode.sh /tmp/install-sourcecode.sh
RUN chmod +x /tmp/install-sourcecode.sh
RUN /tmp/install-sourcecode.sh
RUN /bin/sed -i.bak s/127.0.0.1/gearman/g /root/t3census-worker-detector/worker/Typo3HostDetectorWorker.php

ADD ./gearmanworker.ini /etc/supervisord.d/gearmanworker.ini
VOLUME ["/gearman"]

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
