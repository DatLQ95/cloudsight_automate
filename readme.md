# Usage :
1. Download Ansible: [Link Here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
2. Add the pem keys to credentials/
3. Edit the all.example file and rename it to all
4. Modify the hosts file.
5. Run ./execute_automate.sh 
6. Check the output file in result/

--------------------------------------------------------------------------------------------------------------------------------
# The work this script doing:

Automate the CloudSight deployment / upgrade:
Note: once go up, we can not go down, not backward compatible!
5.3.1 -> 6.0.x -> 6.1.x -> 6.2.x ! 
18.04 -> 20.04 

