---
title: "Configuring an EnviroCams PTZ Camera"
categories:
  - Hardware
tags:
  - EnviroCams
  - FTP
  - How to
author: Colin Brust
author_profile: true
---
As part of Upper Missouri River Basin Plains Snowpack and Soil Moisture Monitoring program, daily photos are provided from each mesonet station. At the Montana Climate Office, we use [EnviroCams](https://www.envirocams.com/) iPatrol PTZ cameras to take these photos at each station. These cameras are great to have in the field because they take quality photos and are able to operate in the extreme heat and cold seen across Montana. However, the documentation that comes with the camera is very lacking, making it difficult for new users to get the cameras setup for their needs. Below is an overview of how we setup our cameras in hopes that it can help others with their setup process. This tutorial assumes the camera is in a remote setting and is connected to the internet via a cell modem with a static I.P. address. 

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

### Connect to Camera and Upload Firmware
- Connect the camera to the computer with an Ethernet cable. 
- Open Internet Explorer and go to https://192.168.1.13
	- This should open an EnviroCams login page. 
		- At the bottom of the page, there should be a popup asking you to download the latest updates. Download and run the executable. 
		- The camera should restart and the login page will reload.
- Login with the default username (admin) and password (123456).
- Update the camera's firmware by navigationg to Setup > System > Maintenance > Local Upgrade > Browse...
	- Select the firmware file downloaded from the [EnviroCams website](https://www.envirocams.com/tech-support/#tab_firmware).
	- The firmware will take a few minutes to upload and apply. Once the changes are made, the camera should restart and you will be taken to the login screen.
  - When logging back in, you will be prompted to update your password.

### Enable Communication with Modem
- Navigate to Setup -> Network -> Network. Change:
	- Obtain IP Address to "Static"
	- IP Address XXX.XXX.XXX.XXX (Here, the first three groups of numbers need to be the same as the first three groups of numbers of the modem's local IP).
	- Subnet Mask to 255.255.255.0
	- Default Gateway to XXX.XXX.XXX.XXX (the same as the modem's local IP).
	- Click 'save'
		- This will reboot the camera and you will be logged out. You will need to repeat the IPv4 change steps above and set the ethernet adapter's I.P. address, subnet mask and default gateway to accommodate the new I.P. address of the modem.
- Login to Modem's user interface (these steps will vary depending on the type of modem you have)
  - In your modem's port forwarding settings:
    - Forward port 80 and from the camera's local I.P. address and set the destination port to a port that is not in use (like 1234). Port 80 is already in use by most modems. Forwarding port 80 will allow access to the camera's user interface remotely.
    - Forward port 554 from the camera's local I.P. address. Port 554 is used for the 'Real Time Streaming Protocol' and allows the video feed from the camera to stream remotely. 
- Connect camera to the modem with an Ethernet cable and make sure both the camera and modem have power. 
  - If everything is setup properly, you should be able to remotely access the camera's user interface by navigating to http://{modem's IP address}:{destination port you set above}.

### Change Camera's Storage Settings
At the Montana Mesonet, we only use the camera for taking photos. If you need to take video, you will need to adjust the storage settings accordingly. 
- In the camera's user interface, navigate to Setup > Storage 
- Under "Allocate Capacity", change "Video" to 0 and "Common Snapshot" to 29705 (or whatever number was originally in "Video". Essentiall. We just want all the storage allocated to the "Common Snapshot"). 
	- This will cause the camera to restart. 


### Setup Time Server
Setting up a time server will allow the camera to always have the correct timestamp on the images. 
- Navigate to Setup > Common > Time
	- First, click "Sync with Computer Time"
	- Change "Sync Mode" to "Sync with NTP Server"
		- Set the timezone based on the UTC offset.
		- Set NTP Server Address to time1.google.com
		- Set Port to 123.
		- Set Update interval to 1800 seconds.
	- Save changes
- Setup Daylight Savings Offset
	- Navigate to Setup > Common > Time > DST
		- Set 'starts' to 2nd Sunday of March at 02:00
		- Set 'ends' to 1st Sunday of November at 02:00
		- Save

### Adjust the Camera's Preset Views
- Navigate to the Live View panel and click the play button in the bottom left corner. This should open up a live video feed from the camera. 
- To set a preset view, use the arrows on the camera to navigate to and focus on the desired area.
	- Click the plus button at the bottom right of the screen. 
	- Add a name and number for the presets. 

### Set the Camera's Patrol
- Click the 'Patrol' tab on the right side of the Live View page. 
	- Click '+' to add a patrol, set:
		- Patrol No. -> 1
		- Patrol Name -> Default
		- Add desired locations from the preset views to the patrol. 
	- Schedule the patrol:
		- Click the tiny little button in the bottom right corner of the screen that has three circles with lines connecting them.
			- Click the checkbox on the top left to enable the patrol.
			- Under 'Monday' set the times of day you would like to do the patrol. 
			- Select the 'default' patrol that was just created.
			- Click the 'copy' button and then paste it into each day of the week. 
			- Click 'OK'.

### Enable Scheduled Snapshots
Unfortunately, the camera doesn't automatically take photos when it arrives at preset positions. As such, our method is to take photos when we know the camera is at certain positions according to the patrol schedule. 

- Navigate to Setup > Video & Audio > Snapshot
- Set:
	-  Snapshot -> "On"
	- Snapshot Interval(s) -> 1
	- Number to Snapshot -> 1
	- Snapshot Mode -> Schedule
		- Set times to match the patrol schedule. 
- Save changes. 

After configuring all these setting, your iPatrol camera should be ready for deployment! 