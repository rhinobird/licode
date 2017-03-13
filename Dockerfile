FROM zevarito/ubuntu-base:latest

MAINTAINER Alvaro Gil

ARG BRANCH

WORKDIR /opt/licode

CMD curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
CMD source ~/.bashrc
CMD nvm install 6.9.2

ADD . .
RUN ./scripts/installUbuntuDeps.sh --cleanup
RUN ./nuve/installNuve.sh
RUN ./scripts/installErizo.sh

ENV LICODE_ROOT /opt/licode
ENV PATH $PATH:/usr/local/sbin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$LICODE_ROOT/erizo/build/erizo:$LICODE_ROOT/erizo:$ROOT/build/libdeps/build/lib
ENV ERIZO_HOME $LICODE_ROOT/erizo/
