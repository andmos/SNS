SNS
===

Simple Network Server (SNS) contains default server setups for the subject "Network Security".
It contains installfiles for a Ubuntu server running the most normal server - roles, but is taylor made to be demonstrating
different aspects of network security, including IDS, mailserver, firewall, LAMP and so on. 

This repo contains a Vagrantfile for current setup, as well as setupscripts for the project. 

Created with Vagrant 1.2.7 and Virtualbox 4.2.16

V 0.1 "Glittertind"
===  
Contains basic WEB - installasion and tools:
- Apache2
- PHP5
- MySQL
- Fail2ban
- Nmap 
- Different attack - scripts
- ufw

Install
===
Dependencies: virtualbox and vagrant:

	sudo apt-get install -y vagrant virtualbox
	git clone https://github.com/andmos/SNS.git
	cd SNS/
	vagrant up
	vagrant ssh

And its up!

