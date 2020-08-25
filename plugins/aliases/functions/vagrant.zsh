
# I often have multiple VM's running at once. This helps shut them all down.
vagrantshutdownall(){
 vagrant global-status  | grep running | awk '{print $1}' | xargs -n1 echo vagrant halt | bash
}