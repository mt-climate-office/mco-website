---
title: "Configuring an EnviroCams PTZ Camera"
categories:
  - Hardware
tags:
  - EnviroCams
  - FTP
  - How to
author_profile: true
---
As part of Upper Missouri River Basin Plains Snowpack and Soil Moisture Monitoring program, daily photos are provided from each mesonet station. At the Montana Climate Office, we use [EnviroCams](https://www.envirocams.com/) to take these photos at each station. These cameras are great to have in the field because they take quality photos and are able to operate in the extreme heat and cold seen across Montana. However, the documentation that comes with the camera is very lacking, making it difficult for new users to get the cameras setup for their needs. Below is an overview of how we setup our cameras in hopes that it can help others with their setup process. 

**NOTE**: Unfortunately, you need a Windows machine with Internet Explorer to fully configure the iPatrol camera. You are able to connect with a Mac/Linux machine and Firefox/Chrome, but some of the functionality is lacking. The latest [firmware update](https://www.envirocams.com/tech-support/#tab_firmware) fixed some of these issues, but Internet Explorer is still the only browser that we have found supports all of the camera's features. 

# Configuring the Camera
### Power Up Camera
- Plug camera into 12v DC power supply.
- Connect camera to computer with ethernet cable.

### Adjust Computer's I.P. Settings
- On your Windows machine, go to settings -> Network and Internet -> Ethernet -> right-click -> properties -> double-click "Internet Protocol Version 4 (TCP/IPv4)"
- Change:
	- IP address to 192.168.1.1
	-  Subnet mask to 255.255.255.0
	-  Default gateway to 192.168.1.1
-  **NOTE** Out of the box, the camera should have an I.P. address of 192.168.1.13. If for some reason the address is different, the first three numbers of theIPv4 address must match the first three number's of the camera's IP (in this case 192.168.1) in order to connect.
