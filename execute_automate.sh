#!/bin/bash

# help menu: 
# -h print the help menu
# -o output file name and directory
# -h get the host name
# -i the key/ permission file
# -k password for become/sudo user


################################################################################
################################################################################
################################################################################

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Automate the check for CloudSight server"
   echo
   echo "Syntax: ./execute_automate.sh [-h|k|o|s|v]"
   echo "options:"
   echo "h     Print this Help."
   echo "k     The super user (sudo) password"
   echo "o     The output file path"
   echo "v     Verbose mode."
   echo
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options

#default values: 
dt=`date '+%d_%m_%Y_%H_%M_%S'`
sudo_password=""
verbose=0
domain=$(< ansible/hosts)
output_file="$domain-$dt.txt"

while getopts ':h:k:o:s:v' OPTION; do
    case "$OPTION" in
        h)
            # Print username
            Help
            exit 1 ;;
        k)
            # Get the password
            sudo_password=$OPTARG ;;
        o)
            # Get the output file
            output_file=$OPTARG ;;
        v)
            # Verbose or not
            verbose=1 ;;
        *)
            # Print helping message for providing wrong options
            Help >&2
            # Terminate from the script
            exit 1 ;;
    esac
done

if [ "$verbose" -eq "1" ]; then
    if [ -z "$sudo_password" ]
    then
        echo "The password is none"
    else
        echo "The password is $sudo_password"
    fi
    echo "The output_file_path is $output_file" 
    echo "The domain is $domain"
fi
# Copy the host file.
cp ansible/hosts /etc/ansible/hosts
[ "$verbose" -eq "1" ] && echo "copy host file to /etc/ansible/hosts"

# Check if we have result folder or not: 
[ -d "result/" ] || mkdir result
# Execute ansible-playbook cmd to a out file in result/
if [ -z "$sudo_password" ]
then
    ansible-playbook ansible/site.yaml >> result/$output_file
else
    ansible-playbook -k $sudo_password ansible/site.yaml >> result/$output_file
fi

# Execute a python script for the following task:
# Clean the oputput file: delete the uncessary lines (fatal lines)

[ "$verbose" -eq "1" ] || python3 save_result.py result/$output_file

echo "Done! Check the output file at result/$output_file"
