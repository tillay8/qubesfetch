echo "$(qubes-hcl-report | grep 'Qubes release')" > /home/$USER/fetchinfo
echo "$(qubes-hcl-report | grep 'RAM:' | cut -c 7-)" >> /home/$USER/fetchinfo
echo "$(xl info | grep _memory| cut -c 26- | head -n 2 | awk 'NR==1 {f=$1} NR==2 {s=$1} END {print f-s " Mb"}')" >> /home/$USER/fetchinfo
echo "$(cat /sys/devices/virtual/dmi/id/product_version) $(cat /sys/devices/virtual/dmi/id/product_name)" >> /home/$USER/fetchinfo
echo "$(qubes-hcl-report | grep 'BIOS:' | cut -c 8-)" >> /home/$USER/fetchinfo
echo "$(lsblk -m --output SIZE -n -d /dev/nvme0n1)" >> /home/$USER/fetchinfo
echo "$(df -h | grep qubes | cut -c 30-33)" >> /home/$USER/fetchinfo
echo "$(uptime -p | cut -c 4-)" >> /home/$USER/fetchinfo
rm ~/*.yml
for vm in "$@"; do qvm-run -q -a "$vm" -- 'rm ~/QubesIncoming/dom0/fetchinfo'; qvm-copy-to-vm "$vm" /home/$USER/fetchinfo; done
rm ~/fetchinfo
