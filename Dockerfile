FROM docker.io/centos:7
MAINTAINER Dan Burke <dburke@liquidweb.com>

#RUN \
#    curl -L  https://github.com/coreos/etcd/releases/download/v2.0.8/etcd-v2.0.8-linux-amd64.tar.gz -o etcd-v2.0.8-linux-amd64.tar.gz && \
#    mkdir /bin && \
#    mv etcd-v2.0.8-linux-amd64/etcd /bin && \

RUN yum install etcd -y

VOLUME ["/data"]
EXPOSE 4001 7001
ENTRYPOINT ["/bin/etcd"]
CMD ["-data-dir=/data"]


#RUN add-apt-repository ppa:fkrull/deadsnakes -y && apt-get update && apt-get install python2.7 -y && apt-get clean

