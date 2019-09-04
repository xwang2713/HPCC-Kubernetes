#!/bin/bash

SCRIPT_DIR=$(dirname $0)
source  ${SCRIPT_DIR}/../bin/common

namespace=default
# Kubernetes quick start Install: https://istio.io/docs/setup/kubernetes/install/kubernetes/

cd ${ISTIO_HOME}

echo "Install all the Istio Custom Resource Definitions (CRDs)"
for i in install/kubernetes/helm/istio-init/files/crd*yaml
do 
  ${KUBECTL} apply -f $i
done

echo "Enforce mutual TLS authentication (restric mutual TLS)"
#${KUBECTL} apply -f install/kubernetes/istio-demo-auth.yaml
${KUBECTL} apply -f ${SCRIPT_DIR}/istio-demo-auth.yaml

echo "Verify the installation"
${KUBECTL} get svc -n istio-system

#echo "Label namespace as istio-injection-enabled"
#${KUBECTL} label namespace  ${namespace} istio-injection=enabled


