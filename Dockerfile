FROM rockylinux:8.7.20221219

RUN yum install -y python3 \
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

RUN pip3 install pexpect

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN echo "Host *" > /etc/ssh/ssh_config.d/NoHostCheck.conf ; \
  echo "  StrictHostKeyChecking no" >> /etc/ssh/ssh_config.d/NoHostCheck.conf