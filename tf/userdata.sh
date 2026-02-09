#!/usr/bin/bash

sudo echo "alias l='ls -latFrh'" >> /home/ec2-user/.bashrc
sudo echo "alias vi=vim"         >> /home/ec2-user/.bashrc
sudo echo "set background=dark"  >> /home/ec2-user/.vimrc
sudo echo "syntax on"            >> /home/ec2-user/.vimrc
sudo echo "alias l='ls -latFrh'" >> /root/.bashrc
sudo echo "alias vi=vim"         >> /root/.bashrc
sudo echo "set background=dark"  >> /root/.vimrc
sudo echo "syntax on"            >> /root/.vimrc

sudo sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
sudo setenforce 0

# packages
sudo zypper refresh
sudo zypper install -y bind-utils mlocate yast2-vm
#sudo zypper install -y -t pattern kvm_server
#sudo zypper install -y libvirt virt-install mkisofs
sudo zypper up -y

systemctl enable libvirtd

echo -n "Active Encryption Features:"
sudo dmesg | grep -i sev | tee -a /etc/motd

echo -n "[cloud-init] reboot now.."
sudo systemctl reboot
