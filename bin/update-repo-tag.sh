#1/bin/sh
set -eux
yq -Y -i --arg repo $2 --arg ref $3 '
  .resources |= map(
    if . | contains($repo) then sub("ref=[^/]+"; "ref=" + $ref) else . end
  )' $1/kustomization.yml
