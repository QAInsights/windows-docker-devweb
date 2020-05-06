# Windows Docker Image for LoadRunner Developer
This docker image helps you to run LoadRunner Developer scripts in Windows container. LoadRunner Developer leverages DevWeb protocol, a brand new offering from Micro Focus.

## Prerequisites

Following are the prerequisites required to work in LoadRunner Developer:

* LoadRunner Developer package (latest stable version)
* Working knowledge on DevWeb protocol. Check out my [Udemy course](https://www.udemy.com/course/performance-testing-using-truweb/) to learn about DevWeb procotol.

## How to download LoadRunner Developer?

LoadRunner Developer is free to use for up to 50 virtual users. You need to create an account at Micro Focus Marketplace.
* Download LoadRunner Windows package from [marketplace](https://marketplace.microfocus.com/appdelivery/content/loadrunner-developer).


## How to build this image?

I suggest you to build this image before you start using it. Follow the below steps to build this image.

* Clone this repository
* Place the DevWeb zip file inside your folder
* Run the build command

`docker build -t <name> .`

e.g. `docker build -t devweb .`

This image uses Windows Server core as base image. It will download Visual C++ Redistributable for Visual Studio 2015 and install it inside your container. This component is prerequisite for LoadRunner Developer.

## How to run the container?

Once the build is successful, you can run the script from the `examples` folder using the below command.

`docker run devweb -mode=single .\examples\EmptyScript`

Important Notes:
* No need to append DevWeb.exe in the command
* Default working directory is `C:\DevWeb_2020.1\DevWeb`

## How to mount the volume to the container?

You can mount your host to the container using the below command.

`docker run --isolation=hyperv -v C:\Scripts\AdvantageOnlineShopping:C:\Scripts\AdvantageOnlineShopping devweb --mode=load C:\Scripts\AdvantageOnlineShopping`

## How to view the results?

Using the mount volume command, after the execution is completed, you can view the results inside the script folder e.g. `C:\Scripts\AdvantageOnlineShopping\results`.

## Why building the image is required?

DevWeb package file is not publicly downloadable. You need to login and download it. This repo doesn't contain the DevWeb package, as it is against Micro Focus terms to host the DevWeb contents in the public repo. It is must for you to download the DevWeb zip file and place it in your local repo.

## Learn more
Visit my [blog](https://qainsights.com/what-is-loadrunner-developer/) to learn more about LoadRunner Developer, DevWeb and more.