default:
	docker build -t ghostplant/flashback -f Dockerfile --network=host .
	docker run -it --rm --privileged -p 8443:8443 -p 5901:5901 -v /external:/root ghostplant/flashback || true

