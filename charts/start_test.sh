helm delete free5gc-v1 && sleep 30
helm install free5gc-v1 ./free5gc
kubectl exec -it $(kubectl get po | grep packetrusher | awk '{print $1}') -- ./app multi-ue -n 1000 --ar 10 --gr 0 --nPdu 0
