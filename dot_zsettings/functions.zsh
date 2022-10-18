tunnel-anything () {
  ssh -M -S /tmp/tunnel-anything-1337 -fnNT -L "1337:localhost:$1" "$2"
  vared -p "Tunnel is to '$2' open, on 1337->$1 (enter to stop)" -c tmp
  ssh -S /tmp/tunnel-anything-1337 -O exit "$2"
}

delete-merged-branches () {
  for branch in $(git branch --merged | grep -v -E 'main|master|develop')
  do
    git branch -d $branch
  done
}

kns () {
  local ns=$(kubectl get namespace | fzf | awk '{print $1}')
  local current=$(kubectl config current-context)
  kubectl config set-context "${current}" --namespace="${ns}"
}

pw () {
  local entry=$(gopass ls -f -s | fzf)
  [ -z "$entry" ] || gopass show -c "${entry}"
}

aws-login () {
  export AWS_PROFILE=$1
  aws sso login --profile $1
  yawsso -p $1
}

summary () {
for tag in $(timew tags | grep BACK | cut -d' ' -f1)
  do
    printf "${tag}:\t $(task ${tag}|tail -2| tr -d '[:space:]')\n"
  done
}

git-personal () {
  git config user.signingkey B42002F0B8E5DE23
  git config user.email mail@morz.me
}

github-clone () {
  local account="${1%%/*}"
  local repo="${1##*/}"
  local folder="${2:-$repo}"

  git clone "git@github.com:${account}/${repo}" "${folder}"
}

local-mc () {
  TMP_MC_KUBECONFIG=$(mktemp)
  local cluster="$(kubectl get cluster | _inline_fzf | awk '{print $1}')"
  kubectl get secret admin-kubeconfig -n cluster-$cluster -otemplate --template='{{.data.kubeconfig}}' | base64 -d > $TMP_MC_KUBECONFIG
  export MC_KUBECONFIG=$TMP_MC_KUBECONFIG
  export POD_NAMESPACE=cluster-$cluster
  export OWNER_EMAIL=moritz@kubermatic.com
  kubectl label --overwrite cluster $cluster worker-name=$(hostname)
  kubectl scale -n cluster-$cluster deployment --replicas=0 machine-controller
  ./hack/run-machine-controller.sh
}

vault-login () {
  export VAULT_ADDR=https://vault.kubermatic.com/
  vault login --method=oidc --path=loodse
}
