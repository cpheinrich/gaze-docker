# Gaze tracking -- Docker

This repository includes a few helper scripts for running the dockerized Gaze ML application -- https://github.com/cpheinrich/gazeml -- for gaze tracking

## Getting started

1) Install the Docker desktop application:   
    --> Mac: https://docs.docker.com/docker-for-mac/install/    
    --> Windows: https://docs.docker.com/docker-for-windows/install/    

2) Clone this repository if you have not already:
```
git clone https://github.com/cpheinrich/gaze-docker.git && cd gaze-docker
```

3) Run the sample script:
```
bash sample.sh
```
This will (i) login with Docker (ii) pull the latest Docker app and (iii) run gaze inference on the video located in `/videos/tracking_sample.mov`.  


To verify that this ran correctly, check to make sure there is a new video called `tracking_sample_output.mp4`
in the `videos` directory which includes the gaze tracking output. 


## Running gaze inference on your own data

You can run gaze inference on your own videos. You must place the video inside of the `/videos` directory to give docker access. Follow the steps below.

1) Place a video inside of the `videos/` directory. For example, say you add the video `my_video.mov` to this directory

2) Run the command as follows:

```
docker run -v $PWD/videos:/src/videos cpheinrich/gaze:latest --from_video /src/videos/my_video.mov
```

It is important that the first part of the path of the argument `--from_video` is `/src/videos/` then the rest of the path will be the relative path of your video
inside of the videos directory. For example, if you add a video inside of a new subdirectory such as  `/videos/patient_videos/patient_video_1.mp4` then you would you use `--from_video /src/videos/patient_videos/patient_video_1.mp4`










