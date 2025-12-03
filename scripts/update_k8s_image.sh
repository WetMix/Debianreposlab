#!bin/bash
IMAGE_NAME="$1"
K8S_DEPLOYMENT_FILE="k8s/deployment.yml"


git config --global user.name 'GitHub Actions'
git config --global user.email 'actions@github.com'

sed -i "s|image:.*|image: ${IMAGE_NAME}|g" ${K8S_DEPLOYMENT_FILE}

git add ${K8S_DEPLOYMENT_FILE}
if git diff --staged --quiet; then
  echo"NO changes to commit."
else
  git commit -m "Update Kubernetes image to ${IMAGE_NAME}"
  #git push origin main
fi
