FROM debian:latest

RUN apt update                                                                   && \
    apt install -q -y                                                               \
        apt-transport-https                                                         \
        ca-certificates                                                             \
         curl                                                                       \
         gnupg2                                                                     \
         software-properties-common                                              && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -      && \
    add-apt-repository                                                              \
       "deb [arch=amd64] https://download.docker.com/linux/debian                   \
       $(lsb_release -cs)                                                           \
       stable"                                                                   && \
    apt update                                                                   && \
    apt install -q -y docker-ce-cli                                              && \
    rm -rf /var/lib/apt/lists

COPY build /usr/local/bin

ENTRYPOINT ["/usr/local/bin/build"]
