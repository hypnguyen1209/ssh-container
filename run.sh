#!/bin/bash

docker build -t ssh-container .

docker run -d -p 80:22 \
	-v /volume/dropbear:/etc/dropbear \
	-v /volume/ssh:/root/.ssh \
	ssh-container
