# Gaze tracking -- Docker

This repository includes a few helper scripts for running the dockerized Gaze ML application -- https://github.com/cpheinrich/gazeml -- for gaze tracking

## Getting started

1) Install the Docker desktop application:   
    --> Mac: https://docs.docker.com/docker-for-mac/install/    
    --> Windows: https://docs.docker.com/docker-for-windows/install/    
   
   **NOTE**: if you are unable to install Docker this may be because you have an older machine in which case you should try to install Docker Toolbox instead:   
    --> Docker toolbox for Mac: https://docs.docker.com/toolbox/toolbox_install_mac/   
    --> Docker toolbox for Windows: https://docs.docker.com/toolbox/toolbox_install_windows/   

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
in the `videos` directory which includes the gaze tracking output, as well as a file `tracking_sample_output.csv` which contains the gaze parameters (theta and phi) for each frame of the video.


## Running gaze inference on your own data

You can run gaze inference on your own videos. You must place the video inside of the `/videos` directory to give docker access. Follow the steps below.

### Single video inference

1) Place a video inside of the `videos/` directory. For example, suppose you add the video `my_video.mov` to this directory. The next step is to:

2) Run the command as follows:

```
docker run -v $PWD/videos:/src/videos cpheinrich/gaze:latest --from_video /src/videos/my_video.mov
```

### Bulk video inference

1) Place a folder of videos inside of the `videos/` directory. For example, suppose you copy a folder called `patient_videos/` which contains multiple videos into the `videos` directory. The next step is to:

2) Run the command as follows:

```
docker run -v $PWD/videos:/src/videos cpheinrich/gaze:latest --from_dir /src/videos/patient_videos/
```

**NOTE**: It is important that the first part of the path of the argument `--from_video` is `/src/videos/` then the rest of the path will be the relative path of your video
inside of the videos directory.


## Interpreting the output

We write an output video and output `.csv` file. The video contains a visualization of the output of the network annotated on top of the video. Meanwhile the `.csv` file contains the gaze parameters tracked for each frame. If the network was unable to recover gaze parameters, that row will be empty. Otherwise, there will be two columns `gaze_theta` and `gaze_phi`. These parameters specify the gaze in spherical coordinates. `gaze_theta` is the yaw angle, and is analogous to longitude on a globe, meanwhile `gaze_phi` is the pitch angle, and is analogous to the latitude on a globe. For more information on spherical coordinates see: https://en.wikipedia.org/wiki/Spherical_coordinate_system.










