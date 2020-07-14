#!/bin/bash

docker login
docker run -v $PWD/videos:/src/videos cpheinrich/gaze:latest --from_video /src/videos/tracking_sample.mov