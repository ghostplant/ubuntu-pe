focal:
	docker build -t ghostplant/flashback -f Dockerfile.2004 --network=host .
	docker run -it --rm -p 8443:8443 -p 5901:5901 -e GEOMETRY=1024x768 -v /external:/root ghostplant/flashback || true

bionic:
	docker build -t ghostplant/flashback -f Dockerfile.1804 --network=host .
	docker run -it --rm -p 8443:8443 -p 5901:5901 -e GEOMETRY=1024x768 -v /external:/root ghostplant/flashback || true

xenial:
	docker build -t ghostplant/flashback -f Dockerfile.1604 --network=host .
	docker run -it --rm -p 8443:8443 -p 5901:5901 -e GEOMETRY=1024x768 -v /external:/root ghostplant/flashback || true

