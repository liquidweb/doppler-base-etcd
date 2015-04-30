

PWD = $(shell pwd)

ETCD_IMAGE          ?= liquidweb/base-etcd
ETCD_VERSION        ?= latest

all: default

default:
	${MAKE} pull
	${MAKE} build

#docker pull coreos/etcd; \

pull:
	@if [ ! -e out/etcd-pull.x ]; then \
		docker pull docker.io/centos:7; \
		touch out/etcd-pull.x; \
	fi

delete:
	docker rmi ${ETCD_IMAGE}:${ETCD_VERSION}

out/etcd-build.x: Dockerfile
	docker build --tag="${ETCD_IMAGE}" .
	touch out/etcd-build.x

build: out/etcd-build.x

clean:
	@rm -f out/etcd-*.x; \


