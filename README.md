Dockerized Darkstar Linux build environment
===========================================

This Docker image was created to make a reproducible ubuntu 14.04(Trusty) build environment for the Darkstar project.

This image contains a volume at /source which needs to be mapped to a darkstar git clone : ie. cd /home/user; git clone https://github.com/DarkstarProject/darkstar.git, and then /source would need to be mapped to /home/user/darkstar to build the freshly cloned repository.

I am hoping that contributing this will avoid the pain of setting a build environment for other people. 

## Step by step example usage

Considering a fresh install of ubuntu 14.04 and Docker isn't yet installed, these steps would be followed to build Darkstar:

* Install docker (Might need massaging on a VPS...):
```
sudo apt-get update
sudo apt-get install wget
wget -qO- https://get.docker.com/ | sh
```

* Verify that docker is properly installed:
```
sudo docker info
```

* Compile Darkstar using the darkstar-dev Docker image
```
cd /home/user/workdir
mkdir output
git clone https://github.com/DarkstarProject/darkstar.git
./compile.sh /home/user/workdir/darkstar /home/user/workdir/output
```

The compile.sh script will compile darkstar from within a temporary Docker container.  Once it is done compiling, the result will remain in /home/user/workdir/darkstar.
The rest of the compile.sh script will stage the build output in the /home/user/workdir/output directory and tar that into darkstar.tar.bz2
darkstar.tar.bz2 used to install darkstar on a ubuntu 14.04 box, and the output folder can be used as a developper test environment.

To develop, you simply have to point your favorite IDE to /home/user/workdir/darkstar, and whenever you need to build, launch compile.sh (Or a stripped down version of it) as often as you want.  The first build will take a long time(Docker will download images and such), but once things gets cached, the build will be much faster.

