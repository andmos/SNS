Simple Network Server
===

Simple Network Server (SNS) contains default server setups for the subject "Network Security".
It contains installfiles for an Ubuntu server running the most normal server - roles, but is taylor made to be demonstrating
different aspects of network security, including IDS, mailserver, firewall, LAMP, webproxy and so on. 

This repo contains a Vagrantfile for current setup, as well as setupscripts for the project. 

Created with Vagrant 1.2.7 and Virtualbox 4.2.16

V 1.0 "Glittertind"
===  
Contains install and configuration of:
- Apache2
- PHP5
- MySQL
- Fail2ban
- Nmap 
- Different attack - scripts
- ufw
- Squid3
- OpenVPN
- Snort
- FreeRadius

Install
===

	sudo apt-get install -y virtualbox vagrant 
	git clone https://github.com/andmos/SNS.git
	cd SNS/
	vagrant up
	vagrant ssh

And its up!

Be aware, all code in this project is for demonstration purpose only. Some of the code may do harm, use it carefully!
