# openwrt-docker
Docker image with prerequisites for building OpenWRT Packages and Firmware Images for the Omega2. Published as `onion/openwrt-sdk-wrapper` on Docker Hub: https://hub.docker.com/r/onion/openwrt-sdk-wrapper

This Docker container is based on Ubuntu 22.04 and comes pre-configured with all necessary packages to run the OpenWRT SDK and image builder.

**Note: this is a baseline Docker image, it does not include the OpenWRT SDK or Image Builder - just the environment to use them! Most users will not need to use this Docker Image!**

## Prerequisites

Ensure that Docker is installed on your system. You can follow Docker's official installation guide [here](https://docs.docker.com/get-docker/).

## Pulling the Docker Image

Pull the published image from Docker Hub:

```
docker pull onion/openwrt-builder
```

## Running the Container
Once the image is available, you can start a container and interact with it:

1. Run the following command to start a container with interactive shell access:
    ```bash
    docker run -it onion/openwrt-builder
    ```
2. This will drop you into a bash shell in the container, where you can run download the OpenWRT SDK and/or image builder and use them.

### Mounting a Volume (Optional)
If you need to work with files from your host machine, you can mount a directory into the container using the -v option. For example:

```bash
docker run -it -v /path/to/local/dir:/root/openwrt onion/openwrt-builder
```

This will mount your local directory to `/root/openwrt` inside the container.

---

## Internal

### Building the Docker Image

To build the Docker image from the provided Dockerfile:

1. Clone or download the Dockerfile into a directory.
2. Open a terminal in that directory.
3. Run the following command to build the image:

   ```bash
   docker build -t onion/openwrt-builder .
   ```

This will create an image named onion/openwrt-builder 

Tag the image and push to Docker Hub as required

