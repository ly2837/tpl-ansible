#!/bin/bash

cd /opt/k8s-node/

# kubelet
openssl genrsa -out kubelet.key 2048
openssl req -new -key kubelet.key -subj "/CN=node_kubelet_$1"  -out kubelet.csr
openssl x509 -req -in kubelet.csr -CA /opt/keys/ca.crt -CAkey /opt/keys/ca.key -CAcreateserial -days 100 -out kubelet.crt

# kube-proxy
openssl genrsa -out kube-proxy.key 2048
openssl req -new -key kube-proxy.key -subj "/CN=node_kube-proxy_$1"  -out kube-proxy.csr
openssl x509 -req -in kube-proxy.csr -CA /opt/keys/ca.crt -CAkey /opt/keys/ca.key -CAcreateserial -days 100 -out kube-proxy.crt