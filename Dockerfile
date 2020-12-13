FROM centos:7

RUN yum -y install https://repo.ius.io/ius-release-el7.rpm \
openssl-devel openssh-clients && yum clean all
RUN yum -y install python36u python36u-pip python36u-devel openldap-devel gcc gcc-c++ kernel-devel \
git-1.8.3.1-22.el7_8

RUN mkdir /app

COPY ./requirements.txt /app/requirements.txt

COPY ./app.py  /app/app.py

WORKDIR /app

RUN pip3.6 install -r requirements.txt

CMD [ "python3.6", "./app.py" ]

