#!/bin/bash
kustomize build common/istio-1-16/istio-crds/base | kubectl apply -f -
kustomize build common/istio-1-16/istio-namespace/base | kubectl apply -f -
kustomize build common/istio-1-16/istio-install/base | kubectl apply -f -
kustomize build common/istio-1-16/istio-crds/base | kubectl apply -f -
kustomize build common/istio-1-16/istio-namespace/base | kubectl apply -f -
kustomize build common/istio-1-16/istio-install/base | kubectl apply -f -
kustomize build common/dex/overlays/istio | kubectl apply -f -
kustomize build common/oidc-authservice/base | kubectl apply -f -
kustomize build common/knative/knative-serving/overlays/gateways | kubectl apply -f -
kustomize build common/istio-1-16/cluster-local-gateway/base | kubectl apply -f -
kustomize build common/knative/knative-eventing/base | kubectl apply -f -
kustomize build common/kubeflow-namespace/base | kubectl apply -f -
kustomize build common/kubeflow-roles/base | kubectl apply -f -
kustomize build common/istio-1-16/kubeflow-istio-resources/base | kubectl apply -f -
kustomize build apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user | awk '!/well-defined/' | kubectl apply -f -
kustomize build contrib/kserve/kserve | kubectl apply -f -
kustomize build contrib/kserve/models-web-app/overlays/kubeflow | kubectl apply -f -
kustomize build apps/katib/upstream/installs/katib-with-kubeflow | kubectl apply -f -
kustomize build apps/centraldashboard/upstream/overlays/kserve | kubectl apply -f -
kustomize build apps/admission-webhook/upstream/overlays/cert-manager | kubectl apply -f -
kustomize build apps/jupyter/notebook-controller/upstream/overlays/kubeflow | kubectl apply -f -
kustomize build apps/jupyter/jupyter-web-app/upstream/overlays/istio | kubectl apply -f -
kustomize build apps/profiles/upstream/overlays/kubeflow | kubectl apply -f -
kustomize build apps/volumes-web-app/upstream/overlays/istio | kubectl apply -f -
kustomize build apps/tensorboard/tensorboards-web-app/upstream/overlays/istio | kubectl apply -f -
kustomize build apps/tensorboard/tensorboard-controller/upstream/overlays/kubeflow | kubectl apply -f -
kustomize build apps/training-operator/upstream/overlays/kubeflow | kubectl apply -f -
kustomize build common/user-namespace/base | kubectl apply -f -

# kubectl get pods -n cert-manager
# kubectl get pods -n istio-system
# kubectl get pods -n auth
# kubectl get pods -n knative-eventing
# kubectl get pods -n knative-serving
# kubectl get pods -n kubeflow
# kubectl get pods -n kubeflow-user-example-com


#  kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80

# kubectl patch service -n istio-system istio-ingressgateway -p '{"spec": {"type": "LoadBalancer"}}'
# kubectl patch service -n istio-system istio-ingressgateway -p '{"spec": {"type": "NodePort"}}'

# kubectl get svc -n istio-system istio-ingressgateway -o jsonpath='{.status.LoadBalancer.ingress[0]}'

# exit
# kubectl debug node/aks-nodepool1-12345678-vmss000000 -it --image=mcr.microsoft.com/dotnet/runtime-deps:6.0
# docker login frontendflaskapi.azurecr.io -u frontendflaskapi -p i4Uj5msmaeu0uWrdE04P3LnI/Vv54o/ReoTHjmtEEC+ACRCZ7eSk
#  kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80

# kubectl patch service -n istio-system istio-ingressgateway -p '{"spec": {"type": "LoadBalancer"}}'


# kubectl get svc -n istio-system istio-ingressgateway -o jsonpath='{.status.LoadBalancer.ingress[0]}'

# kubectl get svc -n istio-system istio-ingressgateway -o yaml


# - email: nelson@larus.com
#   hash: $2a$12$q3uLynyLpeEV24oTuYmpLOG1rgDS6jP6Skxs4NVbOXiyPpIDnw0MG
#   username: admin
#   #12341234n