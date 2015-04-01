FROM docker.io/centos:7
MAINTAINER Dan Burke <dburke@liquidweb.com>

RUN yum clean all && yum update -y && yum clean all
RUN yum install etcd -y && yum clean all

VOLUME ["/data"]
EXPOSE 4001 7001
ENTRYPOINT ["/bin/etcd"]
CMD ["-data-dir=/data"]

