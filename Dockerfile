#    graphviz \
#    openjdk8 \
#    python \
#    py2-pip \

FROM ubuntu:16.04

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    tzdata \
    locales \
    wget \
    ca-certificates \
    libperl5.22 \
    python \
    python-pygments \
    gpp

# Configure timezone and locale, adapted from
# https://serverfault.com/a/689947/122228
RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="de_DE.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=de_DE.UTF-8

# set locale
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales
#RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#    dpkg-reconfigure --frontend=noninteractive locales && \
#    update-locale LANG=en_US.UTF-8
#ENV LANG en_US.UTF-8 

# TeX: aus https://github.com/jagregory/pandoc-docker
RUN apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex \
    latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern
#RUN apt-get install -y --no-install-recommends texlive-full

RUN wget -O pandoc.deb https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-1-amd64.deb
RUN dpkg --install pandoc.deb
RUN rm -rf pandoc.deb

# from http://jaredmarkell.com/docker-and-locales/
#RUN locale-gen en_US.UTF-8
#RUN locale-gen de_DE.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US.UTF-8
#ENV LC_ALL en_US.UTF-8

RUN mkdir -p /work
WORKDIR /work
#ADD directory1 /var/www/directory1
#CMD /bin/sh


