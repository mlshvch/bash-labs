#!/bin/bash

# original image is 2G, create snapshot and make it 10G
qemu-img create -b ~/Downloads/bionic-server-cloudimg-amd64.img -f qcow2 -F qcow2 snapshot-bionic-server-cloudimg.qcow2 10G

# show snapshot info
qemu-img info snapshot-bionic-server-cloudimg.qcow2

# insert network and cloud config into seed image
cloud-localds -v --network-config=network_config_static.cfg ubuntu18_lab.img cloud_init.cfg

# show seed disk just generated
qemu-img info test1-seed.img

