# CHIPinteractive

----

*This is a WORK IN PROGRESS and is not currently working...*

This is an attempt to utilize a container in order to flash a [C.H.I.P.](https://getchip.com/pages/chip).  This is part of a larger project I'm working on for a remote, outdoor network.

You can pull this from Docker Hub:

```
docker pull dswhitley/chipinteractive
```

...or build it on your computer via:

```
git clone https://github.com/dswhitley/CHIPinteractive.git;
cd CHIPinteractive;
docker build -t "chip-interactive" .
```

*NOTE: the build takes about 13 minutes and generates a 1.23GB size image.  There are numerous warnings during the image build, but they do not effect the functionality of the resulting image.*

Then the container needs to run with privileged access to the USB device:

```
docker run -it --rm --name chip --privileged -v /dev/bus/usb:/dev/bus/usb chip-interactive
```

This will utilize the script written by [techgeeksid](https://github.com/techgeeksid/chip-Flash-tool) and prompt you how to proceed.  I have found that, running in a container, I need to run "1" (currently this prompts before installing packages...) before running the commands to flash the C.H.I.P.  It would probably be beneficial to go ahead and do that prep work when the Docker image is built...

----

### DEBUGGING:

The following is helpful in debugging while the container is running:

```
docker exec -it chip /bin/bash
```

----

### REFERENCES:
*  https://github.com/hkuchampudi/CHIPDocker
*  https://github.com/lukeforehand/chip-flash
*  https://github.com/techgeeksid/chip-Flash-tool
*  https://docs.getchip.com/chip.html#setup-ubuntu-for-flashing
