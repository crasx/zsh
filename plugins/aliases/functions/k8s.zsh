#!/bin/zsh

kubeconfigset() {
  # Make sure the kubeconfig input file exists
  if [ ! -f ~/.kube/kubeconfig/$1 ]; then
    echo "File ~/.kube/kubeconfig/$1 does not exist"
    return 1
  fi

  # Make sure the kubeconfig output directory exists
  rm ~/.kube/config
  ln -s ~/.kube/kubeconfig/$1 ~/.kube/config
  ls -l ~/.kube/config
}

# Add zsh completion for kubeconfigset
compdef '_files -W ~/.kube/kubeconfig/' kubeconfigset