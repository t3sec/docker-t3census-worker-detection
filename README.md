# T3census detection worker Docker image

## Details

Docker image that implements a Gearman detection worker for T3census project

## Building image

`sudo docker build -t t3census-worker-detection .`

## Create and using image

* create image: `sudo docker create --link instance.t3census-jobserver:gearman --name instance-0.t3census-worker-detection t3census-worker-detection`
* start image: `sudo docker start instance-0.t3census-worker-detection`
* stop image: `docker stop instance-0.t3census-worker-detection`
* remove image: `docker rm instance-0.t3census-worker-detection`
