# MediaWiki

1.	Mediawiki application has been containerized and is available on docker hub. Link:-[GitHub](https://hub.docker.com/r/nitishfc/media)
1.1	I have used centos/system image for building the mediawiki container.
1.2	I have used deployment object of kubernetes for running application, and it is using NodePort service.
1.3	For updating the application it is using Rolling Update strategy.
1.4	For setting up connectivity between DB and MediaWiki, the LocalSetting.php has been mounted as a secret object.
2.	For DB Mariadb is being used.
2.1	The DB is deployed using Statefulset object of Kubernetes.
2.2	For user creation, database creation I made a script which is being executed by a kubernetes job.

Objectives:-                                                              
* Automation Steps:
1.	Clone the repository 
•	  git clone the repository 
    ```git clone https://github.com/nitishchauhan94/MediaWiki.git```
2.	Execute the setup script 
    ```bash setup.sh```
•	After execution of the script following setups would run
1.	The DB would be setup
#>	Create the PV and PVC , in this case Hostpath  volume would be created
#>	Create the service 
.	Create secret for MySQL DB password
.	Create Statefulset , will be checking the mariadb pod is created or not
.	Once pod created, Kubernetes job would be initiated
.	Configmap for script would be created
.	Kubernetes job will use the above created configmap. The Kubernetes job use the image mysqljob which is host on 
   ```dockerhub:- https://hub.docker.com/r/nitishfc/mysqljob```  and 
   ```dockerfile :- https://github.com/nitishchauhan94/MediaWiki/blob/main/Kubernetes%20job/Dockerfile```
2.	Creation of MediaWiki Application
1.	Creation of configmap for LocalSettings.php will be used for MediaWiki
2.	Create a NodePort service for exposing MediaWiki Application
3.	Creation of MediaWiki Deployment. Image used is available on 
```dockerhub:- https://hub.docker.com/r/nitishfc/media``` ,`
``Dockerfile:- https://github.com/nitishchauhan94/MediaWiki/blob/main/MediaWiki%20Dockerfile/Dockerfile```

After Deployment you can access the UI by using masternodeIP:31845/mediawiki
![Image of MediaWiki](https://github.com/nitishchauhan94/MediaWiki/blob/main/mediawiki.png)
