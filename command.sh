ansible node2 -m raw -a "apt install -y python3"
ansible all -m command -a "uptime"
ansible node1 -m raw -a "echo "hello" > /home/tmp.txt"