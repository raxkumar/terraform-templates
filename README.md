# Ground work Terraform Generator [Discarded]

- This repository contains the terraform templates for running the the below application on the kubernetes environment.

## Set up React + Spring + Keycloak + database 

1. Go to keycloak directory and Run following commands to set up the keycloak service.
```sh
cd keycloak
terraform init
terraform plan
terraform apply
```
note:- wait for the keycloak service to be initialized

2. Go to keycloak-config directory and Run following commands to configure the keycloak with basic components.
```sh
cd ..
cd keycloak-config
terraform init
terraform plan
terraform apply
```

3. Got to react directory and Run following commands to set up react application.
```sh
cd ..
cd react
terraform init
terraform plan
terraform apply
```

4. Go to spring+mysql directory and Run following commands to to set up the spring application and database(mysql).
```sh
cd ..
cd react
terraform init
terraform plan
terraform apply
```
5. To check the running service Run follwing commands.
```sh
kubectl get service -n <namespace>
minikube service <service-name> -n <namespace>
```
