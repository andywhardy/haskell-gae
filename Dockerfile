FROM ubuntu:14.04

ENV HASKELL_GAE_DIR=/opt/haskell-gae
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
RUN echo 'deb http://download.fpcomplete.com/ubuntu trusty main'|sudo tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && sudo apt-get install haskell-platform stack -y

RUN mkdir -p ${HASKELL_GAE_DIR}
COPY . ${HASKELL_GAE_DIR}/
WORKDIR ${HASKELL_GAE_DIR}/ 
RUN stack setup
RUN stack build

EXPOSE  8080
ENTRYPOINT ["stack", "exec", "haskell-gae"]
