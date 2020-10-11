#setting up application 
echo "Creation of svc"
kubectl apply -f svc.yaml
sleep 3
kubectl get svc 
echo "Configmap creation"
kubectl create configmap setting --from-file=LocalSettings.php
echo "Application deployment"
kubectl apply -f media.yaml
sleep 5 
kubectl get deployment 
sleep 30 
kubectl get po 