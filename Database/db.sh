#Mariadb cluster creation
echo "create pv and pvc"
kubectl apply -f pv.yaml
sleep 3
kubectl get pv,pvc
sleep 3
echo "create service for mariadb"
kubectl apply -f svc.yaml
sleep 3
kubectl get svc
sleep 3
echo "Create secret"
kubectl create secret generic mysqlpassword --from-literal=mariadb-pass-root=password
sleep 3
kubectl get secrets
echo "Create stateful set"
kubectl apply -f db.yaml 
sleep 3
kubectl get statefulset 
sleep 40
kubectl get po

status=`kubectl get po | grep -i nmariadb | awk '{print $3}'`
if [ "$status" == Running ];
then
echo "Running kubernetes job script"
#kubectl create configmap myjob --from-file=job_script.sh
bash job.sh

else
   sleep 10
   if [ "$status" == Running ];
   then
   sleep 10
   echo "Running kubernetes job script"
   bash job.sh
 
   else
    echo "Check the service"
   fi
fi
