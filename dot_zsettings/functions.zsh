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

ensure-1password-login () {
  op list vaults &> /dev/null
  if [ "$?" -ne "0" ]
  then
    eval $(op signin "${subdomain}")
  fi
  op list vaults &> /dev/null || return 1
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

github () {
  git clone git@github.com:${1} "${2}"
}
