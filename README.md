# MediaWiki

1.	Mediawiki application has been containerized and is available on docker hub. Link:-   , Dockerfile:- .
•	I have used centos/system image for building the mediawiki container.
•	I have used deployment object of kubernetes for running application, and it is using NodePort service.
•	For updating the application it is using Rolling Update strategy.
•	For setting up connectivity between DB and MediaWiki, the LocalSetting.php has been mounted as a secret object.
2.	For DB Mariadb is being used.
•	The DB is deployed using Statefulset object of Kubernetes.
•	For user creation, database creation I made a script which is being executed by a kubernetes job.
Objectives:-                                                              
* Automation Steps:
1.	Clone the repository 
•	  Ggit clone <>

2.	Execute the master script 
•	Bash master.sh The steps what would run are as follows 
1.	The DB would be setup
	Create the PV and PVC , in this case Hostpath  volume would be created
	Create the service 
	Create secret for MySQL DB password
	Create Statefulset , will be checking the mariadb pod is created or not
	Once pod created, Kubernetes job would be initiated
	Configmap for script would be created
	Kubernetes job will use the above created configmap. The Kubernetes job use the image mysqljob which is host on dockerhub:-  and dockerfile :- 
2.	Creation of MediaWiki Application
1.	Creation of secret for LocalSettings.php will be used for MediaWiki
2.	Create a NodePort service for exposing MediaWiki Application
3.	Creation of MediaWiki Deployment. Image used is available on dockerhub:-  ,Dockerfile:-