cd ~
mkdir ansible-reboot
cd ansible-reboot
echo " create invetory.txt file and paste list of servers"
sleep 20

echo "[servers] 192.168.43.13 192.168.43.11" >vi inventory.txt
sleep 20

echo "create ansible.cfg and paste the default content in it"
echo "[defaults] host_key_checking = False inventory=inventory.txt interpreter_python=auto_silent localhost_warning=false" > ansible.cfg

### Validate and check the inventory.
ansible-inventory --graph

###Check the connectivity to the target nodes. to be sure you can ping all your servers.
ansible all -m ping

### Create a file ansible-patch.yml and paste the code below inside.
touch patch.yml

### validate the syntax of our playbook to avoid errors when running it.
ansible-playbook patch.yml --syntax-check

### To run the playbook, run the code below
ansible-playbook patch.yml
