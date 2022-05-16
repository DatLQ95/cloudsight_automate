# What is it? Why we need this?
This is the program to deploy/upgrade and modify the CS server. 

# Usage :
1. Download Ansible: [Link Here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. Add the pem keys (access key) to credentials/
3. Add the keystore files to the key_files/{ domain_name }
4. Add the truststore files to key_files/ (if it already there, no need to do it again)
5. Edit the all.example file and rename it to all
6. Modify the hosts file, add the hostname of the CS server.
7. Run ./execute_automate.sh 
8. Check the output file in result/

--------------------------------------------------------------------------------------------------------------------------------
<!-- # The work this script doing:
5.3.1 -> 6.0.x -> 6.1.x -> 6.2.x ! 
18.04 -> 20.04  -->

<!-- -------------------------------------------
For full setup: 
This is for register DNS in first place:
1. Add the domain name to DNS server so we can look it up on internet. (1 A record, 4 NS record for domain and 4 for wildcard)

This one is for automatic certificate renewal every 2 months: 
2. ./acme.sh --issue -d *.3net.intenocloud.no -d 3net.intenocloud.no --dns --yes-I-know-dns-manual-mode-enough-go-ahead-please
Acme.sh is not working, fix it later.
3. ./acme.sh --renew -d *.3net.intenocloud.no -d 3net.intenocloud.no --dns --yes-I-know-dns-manual-mode-enough-go-ahead-please

4. From this -> prepare the http.keystore

5. Transfert the keystore to start the upgrade! -->