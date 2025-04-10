#!/bin/bash
NAME=$1
if [ -z "$NAME" ]; then
    echo "Usage: $0 <name>[:<tag>]"
    exit 1
fi
docker buildx create --use --driver-opt image=moby/buildkit:v0.20.2 --name buildkit_20
docker buildx build --builder buildkit_20 --build-arg SOURCE_DATE_EPOCH="0" --output type=docker,name=$NAME,rewrite-timestamp=true .
