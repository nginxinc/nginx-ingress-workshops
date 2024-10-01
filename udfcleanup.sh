kubectl delete ns juice
helm uninstall nginx-grafana -n monitoring
helm uninstall nginx-prometheus -n monitoring
helm repo remove grafana
helm repo remove prometheus-community
kubectl delete ns monitoring
kubectl delete all --all
kubectl delete vs --all
kubectl delete secret cafe-secret
kubectl delete -f Plus/labs/lab4/dashboard-vs.yaml 
kubectl apply -f Plus/labs/lab2/nginx-config.yaml