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

### Connect to and Configure Camera
- Connect the camera to the computer with an Ethernet cable. 
- Open Internet Explorer and go to https://192.168.1.13
	- This should open an EnviroCams login page. 
		- At the bottom of the page, there should be a popup asking you to download the latest updates. Download and run the executable. 
		- The camera should restart and the login page will reload.
- Login with the default username (admin) and password (123456).
- Update the camera's firmware by navigationg to Setup > System > Maintenance > Local Upgrade > Browse...
	- **Select the Firmware file in the resources folder.**
	- The firmware will take a few minutes to upload and apply. Once the changes are made, the camera should restart and you will be taken to the login screen.
	- Navigate to the Setup tab -> Common -> User -> edit -> change password to Mc02o16-- (Need to use hyphens instead of our usual slashes because the camera doesn't allow for password with hyphens.)

### Change Camera's Local I.P. Address to Match Modem

- Navigate to Setup -> Network -> Network. Change:
	- Obtain IP Address to "Static"
	- IP Address 192.168.13.105 (Here, the first three groups of numbers need to be the same as the first three groups of numbers of the modem's local IP).
	- Subnet Mask to 255.255.255.0
	- Default Gateway to 192.168.13.31 (the same as the modem's local IP).
	- Click 'save'
		- This will reboot the camera and you will be logged out. You will need to repeat the IPv4 change steps above and set the ethernet adapter's I.P. address, subnet mask and default gateway to 192.168.13.1, 255.255.255.0, and 192.168.13.1, respectively. 
- After changing the I.P. address and changing the ethernet adapter's settings, log back in to the camera with its new I.P. address (192.168.13.105). 

### Change Camera's Storage Settings
- In the camera's user interface, navigate to Setup > Storage 
- Under "Allocate Capacity", change "Video" to 0 and "Common Snapshot" to 29705 (or whatever number was originally in "Video". Essentiall. We just want all the storage allocated to the "Common Snapshot"). 
	- This will cause the camera to restart. 
- Under Setup > Storage > FTP, set:
	-  Server IP = 150.131.194.163
	- Port No. = 21
	- Username = mesonetCamera
	- Password = escapableRetrainUmbrella
	- Under directory structure, select two "Custom" paths and add 'file' and then and type the name of the station (e.g. acecrowa) that the camera is assigned to. 
	- Under "Naming Element", select "Time" under the first dropdown.
		- Save all changes.

### Setup Time Server
- Navigate to Setup > Common > Time
	- First, click "Sync with Computer Time"
	- Change "Sync Mode" to "Sync with NTP Server"
		- Set Time Zone to the current UTC offset (UTC-06:00 for standard time, UTC-07:00 for savings time)
		- Set NTP Server Address to time1.google.com
		- Set Port to 123.
		- Set Update interval to 1800 seconds.
	- Save changes
- Setup Daylight Savings Offset
	- Navigate to Setup > Common > Time > DST
		- Set 'starts' to 2nd Sunday of March at 02:00
		- Set 'ends' to 1st Sunday of November at 02:00
		- Save

### Enable Scheduled Snapshots
- Navigate to Setup > Video & Audio > Snapshot
- Set:
	-  Snapshot -> "On"
	- Most Large(KB) -> 750
	- Resolution -> 1920 x 1080
	- Snapshot Interval(s) -> 1
	- Number to Snapshot -> 1
	- Snapshot Mode -> Schedule
		- Set photo times for:
			- 09:04
			- 09:09
			- 09:14
			- 09:19
			- 09:24
			- 15:04
			- 15:09
			- 15:14
			- 15:19
			- 15:24
- Save changes. 

### Enable Onscreen Display
- Navigate to Setup > Image > OSD
	- All information on top row of image. from left to right
		- \<Custom\> (set to station name)
		- \<Preset\>
		- <Date & Time>

### Adjust the Camera's Preset Views
- Navigate to the Live View panel and click the play button in the bottom left corner. This should open up a live video feed from the camera. 
- To set a preset view, use the arrows on the camera to navigate to and focus on the desired area.
	- Click the plus button at the bottom right of the screen. 
	- Add a name and number for the presets. 
- Set the following 5 presets in this order with the same names:
	1. North: focused on the North snowstake
	2. North Sky: capture both the station and the North horizon and sky.
	3. South: focused on the South snowstake
	4. South Sky: capture both the station and the South horizon and sky.
	5. Pluviometer: focus on the pluviometer. 

### Set the Camera's Patrol
- Click the 'Patrol' tab on the right side of the Live View page. 
	- Click '+' to add a patrol, set:
		- Patrol No. -> 1
		- Patrol Name -> Default
		- Add 5 locations to the patrol, for all of them choose 'GoTo Preset', set the speed to 10, set the wait time to 300 seonds.
		- Set the following order of presets **THE ORDER IS IMPORTANT, MAKE SURE THE ORDER FOLLOWS THIS PATTERN**:
			1. South
			2. South Sky
			3. North Sky
			4. North
			5. Pluviometer
	- Schedule the patrol:
		- Click the tiny little button in the bottom right corner of the screen that has three circles with lines connecting them.
			- Click the checkbox on the top left to enable the patrol.
			- Select the following time ranges for Monday: 
				- 9:00 - 9:30
				- 15:00 - 15:30
			- Select the 'default' patrol that we just created.
			- Click the 'copy' button and then paste it into each day of the week. 
			- Click 'OK'.

### Configure Modem to Forward Camera Data
- Either manually or remotely connect to modem that the camera will be attached to.
- Navigate to Security -> Port Forwarding -> Add new port
	- Set the public start and end port to 8080, set the host IP to camera's IP address (192.168.13.105), set the private port to 80.
	- Configure another port: Set public start and end ports to 554, set the host IP to camera's IP address (192.168.13.105), set the private port to 554.
- Apply changes and reboot the modem.

### Check Comms with Modem and Camera
- Make sure the modem is on and attached to antennae. 
- Make sure camera is powered on. 
- Attach camera to modem with an Ethernet cable. 
- Verify that you can access the camera's GUI website:
	- Navigate to XXX.XXX.XXX.XXX:8080 (modem's IP address)
		- **NOTE** You have to use http:// before the address (not https).

### Export Configuration 
-  Navigate to Setup -> System -> Maintenance -> Config Management:
	-  Export the camera configuration

# Setup from Config File
- Navigate to Setup -> System -> Maintenance -> Config Management:
	- Import the camera configuration template available in OneDrive.
	- The camera will reboot.
- If you do this you still have to change the following settings:
	- "Change Camera's Local I.P. Address to Match Modem"section
	- "Change Camera's Storage Settings" section
	- Change the camera's OSD to match the station name.
	- Change the directory name the station is saving to in the FTP settings. 