minecraft-automation-scripts (simple edition)
=============================================

scripts to start a Minecraft server and restart it automatically

Features
--------

 * Uses screen to run 24/7
 * minimal user effort to use
 * doesn't require chron
 * easily configurable
 * nicknames for server screen sessions for multiple instances
 * warns if there is another screen session running with the same name

Requirements
------------
screen, Linux/unix operating system

you will also need minecraft ready set up (install java download minecraft jar agreeing to the eula and all that)

Access server console
=====================

	screen -r mc

Exit the console
	
	Ctrl+A D
	
Stop the server
	
	Ctrl+C
	


Setup
=====

1. make the script exacuitable 

		chmod 755  ~/startmc.sh
		chmod 755  ~/mainstart.sh

2. Edit the settings in `config.cfg` to match your setup (like the directory the server jar is in and the name of the jar)

3. thats it!

Usage
=====

1. run `startmc.sh` this will intern start mainstart.sh in a screen called `restartscript` which will be incharge or restarting the mc server

2. Exit the screen by doing `Ctrl+A D`

3. you can start `mainstart.sh` manually but this will skip checking if there is a server already up.

4. If you want the scripts to start on boot use the `mainstart.sh` script and skip the startmc.sh
