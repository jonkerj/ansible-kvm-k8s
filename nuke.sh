for NODE in kube1 kube2 kube3; do
  virsh destroy $NODE
  virsh undefine $NODE
  rm -f /var/lib/libvirt/images/${NODE}.{qcow2,ign}
done
for IP in 172.21.45.2 172.21.45.3 172.21.45.4; do
  ssh-keygen -R $IP
done
rm -f ~/.kube/config
