#!/bin/sh
export GOPATH=/build
go get github.com/miekg/dns
go get github.com/mesosphere/mesos-dns
cd $GOPATH/src/github.com/mesosphere/mesos-dns
go build -o mesos-dns
cp mesos-dns /