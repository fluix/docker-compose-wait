.PHONY: build release clean all

all: clean build

build:
	docker run --rm \
           		-v $$(pwd):/app \
				rust \
				bash -c "cd /app && cargo build --release --target=x86_64-unknown-linux-musl"

pack:
	cd ./binary &&  gzip -9 memdisk-cloudwatch-x86_64 && gzip -9 memdisk-cloudwatch-arm64

release: all pack

clean:
	rm -Rf ./binary

docker-clean:
	docker rmi memdisk-cloudwatch-build