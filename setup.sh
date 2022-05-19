# Kubermatic Machine Controller

cd /tmp/
mkdir kubecorps
cd kubecorps
mkdir kubermatic
cd kubermatic

git clone https://github.com/kubermatic/machine-controller.git

cd machine-controller
make deploy

rm -rf /tmp/kubecorps

# Tekton
kubectl apply --filename https://storage.googleapis.com/tekton-releases-nightly/pipeline/latest/release.yaml

kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

# Tekton Catalog
tkn hub install task git-clone
tkn hub install task kaniko