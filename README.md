# Ansible Collection - alex.preinstall collection
Documentation for the collection.

# Install
ansible-galaxy collection install git+https://github.com/AlexanderWitteveen/ALEX.Ansible.preinstall.git

# Use playbook
vars="{\"args_dhcpipaddress\":\"hostip\"}"  
export ANSIBLE_CONFIG=/etc/ansible/ansible.cfg  
ansible-playbook alex.preinstall.preinstall1 -vv --extra-vars "$vars"  
ansible-playbook alex.preinstall.preinstall2 -vv --extra-vars "$vars"

