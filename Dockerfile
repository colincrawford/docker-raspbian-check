FROM raspbian/stretch

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl build-essential -y

RUN curl -L -o check-0.12.0.tar.gz https://github.com/libcheck/check/releases/download/0.12.0/check-0.12.0.tar.gz \
    && tar xvzf check-0.12.0.tar.gz \
    && rm check-0.12.0.tar.gz \
    && cd check-0.12.0 \
    && ./configure \
    && make \
    && make check \
    && make install

ENV LD_LIBRARY_PATH "/usr/local/lib"
