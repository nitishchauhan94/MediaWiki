echo " job for DB creation"
kubectl create configmap myjob --from-file=job_script.sh
kubectl apply -f job.yaml
echo "Sleep for 40 seconds then will check status"
sleep 40
a=`kubectl get po | grep mysqljob | awk {'print $1'}`
echo $a
kubectl logs $a 
echo "Job Executed"
