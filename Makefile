# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: commerciumx android ios commerciumx-cross swarm evm all test clean
.PHONY: commerciumx-linux commerciumx-linux-386 commerciumx-linux-amd64 commerciumx-linux-mips64 commerciumx-linux-mips64le
.PHONY: commerciumx-linux-arm commerciumx-linux-arm-5 commerciumx-linux-arm-6 commerciumx-linux-arm-7 commerciumx-linux-arm64
.PHONY: commerciumx-darwin commerciumx-darwin-386 commerciumx-darwin-amd64
.PHONY: commerciumx-windows commerciumx-windows-386 commerciumx-windows-amd64
##export GOPATH=$(pwd)
GOBIN = $(shell pwd)/build/bin
GO ?= latest

commerciumx:
	build/env.sh go run build/ci.go install ./cmd/commerciumx
	@echo "Done building."
	./build/bin/commerciumx init genesis.json
	@echo "Run \"$(GOBIN)/commerciumx\" to launch commerciumx."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install
	./build/bin/commerciumx init genesis.json

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/commerciumx.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/commerciumx.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/kevinburke/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go get -u github.com/golang/protobuf/protoc-gen-go
	env GOBIN= go install ./cmd/abigen
	@type "npm" 2> /dev/null || echo 'Please install node.js and npm'
	@type "solc" 2> /dev/null || echo 'Please install solc'
	@type "protoc" 2> /dev/null || echo 'Please install protoc'

# Cross Compilation Targets (xgo)

commerciumx-cross: commerciumx-linux commerciumx-darwin commerciumx-windows commerciumx-android commerciumx-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-*

commerciumx-linux: commerciumx-linux-386 commerciumx-linux-amd64 commerciumx-linux-arm commerciumx-linux-mips64 commerciumx-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-*

commerciumx-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/commerciumx
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep 386

commerciumx-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/commerciumx
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep amd64

commerciumx-linux-arm: commerciumx-linux-arm-5 commerciumx-linux-arm-6 commerciumx-linux-arm-7 commerciumx-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep arm

commerciumx-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/commerciumx
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep arm-5

commerciumx-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/commerciumx
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep arm-6

commerciumx-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/commerciumx
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep arm-7

commerciumx-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/commerciumx
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep arm64

commerciumx-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/commerciumx
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep mips

commerciumx-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/commerciumx
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep mipsle

commerciumx-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/commerciumx
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep mips64

commerciumx-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/commerciumx
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-linux-* | grep mips64le

commerciumx-darwin: commerciumx-darwin-386 commerciumx-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-darwin-*

commerciumx-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/commerciumx
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-darwin-* | grep 386

commerciumx-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/commerciumx
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-darwin-* | grep amd64

commerciumx-windows: commerciumx-windows-386 commerciumx-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-windows-*

commerciumx-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/commerciumx
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-windows-* | grep 386

commerciumx-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/commerciumx
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/commerciumx-windows-* | grep amd64
