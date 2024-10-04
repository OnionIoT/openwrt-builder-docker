# openwrt-docker
Docker image for building OpenWRT Packages and Firmware Images for the Omega2

This Docker container is based on Ubuntu 22.04 and comes pre-configured with all necessary packages to run the OpenWRT SDK and image builder.

## Prerequisites

- Ensure that Docker is installed on your system. You can follow Docker's official installation guide [here](https://docs.docker.com/get-docker/).

## Building the Docker Image

To build the Docker image from the provided Dockerfile:

1. Clone or download the Dockerfile into a directory.
2. Open a terminal in that directory.
3. Run the following command to build the image:

   ```bash
   docker build -t onion/openwrt-builder .
   ```

This will create an image named onion/openwrt-builder.

## Running the Container
Once the image is built, you can start a container and interact with it:

1. Run the following command to start a container with interactive shell access:
    ```bash
    docker run -it onion/openwrt-builder
    ```
2. This will drop you into a bash shell in the container, where you can run OpenWRT SDK and image builder commands.

### Mounting a Volume (Optional)
If you need to work with files from your host machine, you can mount a directory into the container using the -v option. For example:

```bash
docker run -it -v /path/to/local/dir:/root/openwrt onion/openwrt-builder
```

This will mount your local directory to `/root/openwr`t` inside the container.

---

## Running on ARM Systems with QEMU
If you're running this Docker container on an ARM-based system (like Macs with Apple Silicon), you will need to emulate the x86_64 architecture to use the x86-based build tools. This can be achieved by using QEMU.

### Enabling QEMU for x86_64 Emulation
1. **Install QEMU on the Host:**
    On your ARM host, install QEMU and the required packages for emulation. Run the following commands:
    ```bash
    sudo apt update
    sudo apt install -y qemu-system qemu-user-static binfmt-support
    ```
2. **Register QEMU for x86_64 Emulation:**
    You need to enable QEMU to interpret the x86_64 binaries inside Docker containers. Run the following command:
    ```bash
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
    ```
3. **Verify QEMU Setup:** 
    To verify that QEMU can successfully emulate x86_64, you can run the following command to check that the architecture is correctly emulated:
    ```bash
    docker run --rm -t --platform linux/amd64 ubuntu uname -m
    ```
    If the output is x86_64, QEMU is set up correctly.

4. **Running the OpenWRT SDK Image:**
    Now, you can run the OpenWRT SDK Docker image using QEMU to emulate the x86_64 architecture:
    ```bash
    docker run --platform linux/amd64 -it onion/openwrt-builder
    ```
    This will start the container with x86_64 emulation on your ARM system.

---

## Notes

- After running the container, all the tools required for OpenWRT development are available in the /root directory.
- You can start running OpenWRT SDK scripts or use git to fetch the necessary source code.