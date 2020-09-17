FROM centos:8

RUN yum install -y python2 python38 \
                   epel-release \
                   make cmake \
                   git \
                   openssh-clients \
                   which \
                   libnsl libaio \
                   unzip \
                   jq \
                   diffutils \
                   sudo && \
    yum install -y ansible && \
    yum clean all

RUN alternatives --set python /usr/bin/python2

RUN pip2 install pexpect

RUN echo "Host *" > /etc/ssh/ssh_config.d/NoHostCheck.conf ; \
    echo "  StrictHostKeyChecking no" >> /etc/ssh/ssh_config.d/NoHostCheck.conf