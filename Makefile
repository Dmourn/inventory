
DESTDIR=/usr/local/bin

build:
	./build.sh
clean:
	podman system prune || docker system prune

install:
	install -m 0755 ./scripts/inventory ${DESTDIR}
	install -m 0755 ./scripts/take ${DESTDIR}
	install -m 0755 ./scripts/drop ${DESTDIR}
