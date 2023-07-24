### Cloud Native Monitoring App

### How to Use
I ran into a few complications when building this on MacOS but don't worry, this Readme contains every problem i faced and how to resolve them.

# Running your app locally

When running the app locally, if you try to use the default port, you will get the following error
```
Address already in use
Port 5000 is in use by another program. Either identify and stop that program, or start the server with a different port.
On macOS, try disabling the 'AirPlay Receiver' service from System Preferences -> Sharing.
```
the easiest way to solve this is by specifying the port as i did on app.py:16

# Building Docker image

When building the docker image with the following command "docker build -t <image-name> .", the build process fails when trying to install psutil. so the solution i used for this was to specify the build platform.

```
docker build --platform linux/amd64 -t <image-name> . 
```
Also recall the default port 5000 is already in use by another service hence the need to expose a different port in the Dockerfile.

To see that the image has been created and is available.
```
docker images
```

# Running the Docker image

Trying to run the docker image with the normal "docker run -p 3000:3000 <image-id>" will not work.

The flask app will still try to use port 5000 in the container so in order to resolve that, we need the route the ports properly.

```
docker run -p 3000:5000 <image-id>
```

Now our monitoring app will be available at http://127.0.0.1:3000

### Developer
This tool was created by Daniel Pereowei Iwenya. <a href="mailto:iwenyadaniel12@gmail.com">Contact Developer.</a>
