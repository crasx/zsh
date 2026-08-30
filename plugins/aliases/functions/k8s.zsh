#!/bin/zsh

kubeconfigset_permanent() {
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

kubeconfigset() {
  # Make sure the kubeconfig input file exists
  if [ ! -f ~/.kube/kubeconfig/$1 ]; then
    echo "File ~/.kube/kubeconfig/$1 does not exist"
    return 1
  fi
  export KUBECONFIG="$HOME/.kube/kubeconfig/$1"
}

# Add zsh completion for kubeconfigset
if [ -n "$ZSH_VERSION" ]; then
  compdef '_files -W ~/.kube/kubeconfig/' kubeconfigset
fi


kubenuke() {
  # Force-delete a kubernetes namespace, even if it is stuck in "Terminating".
  local ns="$1"
  if [ -z "$ns" ]; then
    echo "Usage: kubenuke <namespace>"
    return 1
  fi

  if ! kubectl get namespace "$ns" >/dev/null 2>&1; then
    echo "Namespace '$ns' does not exist"
    return 1
  fi

  echo "About to NUKE namespace '$ns' on context '$(kubectl config current-context)'."
  echo -n "Type the namespace name to confirm: "
  read -r confirm
  if [ "$confirm" != "$ns" ]; then
    echo "Aborted."
    return 1
  fi

  # Try a normal delete first (with a short grace period).
  kubectl delete namespace "$ns" --wait=false

  # If it's stuck Terminating, strip finalizers via the raw API.
  echo "Waiting for namespace to terminate..."
  local i
  for i in {1..15}; do
    if ! kubectl get namespace "$ns" >/dev/null 2>&1; then
      echo "Namespace '$ns' nuked."
      return 0
    fi
    sleep 2
  done

  echo "Namespace still terminating; removing finalizers..."
  kubectl get namespace "$ns" -o json \
    | jq 'del(.spec.finalizers)' \
    | kubectl replace --raw "/api/v1/namespaces/$ns/finalize" -f -

  if kubectl get namespace "$ns" >/dev/null 2>&1; then
    echo "Namespace '$ns' still present; manual intervention may be required."
    return 1
  fi
  echo "Namespace '$ns' nuked."
}

alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"
