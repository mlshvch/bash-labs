#!/bin/bash

virt-install --name server --virt-type kvm --memory 2048 --vcpus 2 --boot hd,menu=on --disk path=ubuntu18_lab.img,device=cdrom --disk path=snapshot-bionic-server-cloudimg.qcow2,device=disk --graphics vnc --os-type Linux --os-variant ubuntu18.04 --network network:default --console pty,target_type=serial, --net hostfwd=tcp::1810-:22

# virt-install 
# --name test1 
# --virt-type kvm 
# --memory 2048 
# --vcpus 2 
# --boot hd,menu=on 
# --disk path=test1-seed.img,device=cdrom 
# --disk path=snapshot-bionic-server-cloudimg.qcow2,device=disk 
# --graphics vnc 
# --os-type Linux 
# --os-variant ubuntu18.04 
# --network network:default 
# --console pty,target_type=serial
