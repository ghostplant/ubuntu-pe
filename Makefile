default:
	docker build -t ghostplant/flashback -f Dockerfile.2204 --network=host .
	docker run -it --rm --privileged -p 8443:8443 -p 5901:5901 -e GEOMETRY=1024x768 -v /external:/root ghostplant/flashback || true

