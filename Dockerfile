FROM ruby:2.3.1

ENV code /code

WORKDIR ${code}

RUN apt-get update
RUN apt-get install apt-transport-https
RUN wget https://cdn.crate.io/downloads/apt/DEB-GPG-KEY-crate
RUN apt-key add DEB-GPG-KEY-crate


RUN echo 'deb http://http.debian.net/debian jessie-backports main' >> /etc/apt/sources.list
RUN echo 'deb-src https://cdn.crate.io/downloads/apt/stable/ jessie main' >> /etc/apt/sources.list
RUN echo 'deb https://cdn.crate.io/downloads/apt/stable/ jessie main' >> /etc/apt/sources.list


RUN apt-get update
RUN apt-get install -y crate
RUN systemctl enable crate


ADD . $code

RUN bundle