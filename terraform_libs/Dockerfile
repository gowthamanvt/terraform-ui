FROM golang:alpine

ENV TERRAFORM_VERSION=0.11.13

RUN apk add --update git bash openssh 

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
EXPOSE 22
ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform

RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

WORKDIR $GOPATH
RUN /usr/bin/ssh-keygen -A 
CMD ["/usr/sbin/sshd", "-D"]