.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/anthony19114/commerciumx/cmd/swarm
	go build -o bin/geth     github.com/anthony19114/commerciumx/cmd/geth
	go build -o bin/bootnode github.com/anthony19114/commerciumx/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/anthony19114/commerciumx/swarm/...
