FROM debian:latest

RUN apt-get update && apt-get install -y \
    sudo \
    git

# create the reposerver user
RUN groupadd -g 999 reposerver && \
    useradd -u 999 -g reposerver reposerver

# create two users in git group
RUN groupadd git && \
    useradd -u 1001 -g git user1 && \
    useradd -u 1002 -g git user2

ADD sudoers /etc/sudoers

USER 999
