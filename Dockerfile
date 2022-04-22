FROM debian:unstable-slim

RUN apt update && apt upgrade -y && apt -y install make

COPY ./test /test
COPY ./Makefile /Makefile
COPY ./scripts /scripts


RUN ["bash","-c", "make install && cd /test && ./test.sh"]
# I'm sure there is a much better way to do this
ENTRYPOINT ["bash","-c", "cd /test && bash -i"]
