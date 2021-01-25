## setup EKS Cluster usin Terraform 
   1. Launch ec2 machine 
   2. install terraform[terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) and awscli ```sudo apt-get install awscli -y``` , kubectl ```sudo snap install kubectl --classic```  
   3. create IAM user and configure awscli ```aws configure``` 
   4. clone the terraform files and run terraform cli [clickhere](https://github.com/thingsboard/thingsboard-ce-k8s.git)
      ```git clone https://github.com/thingsboard/thingsboard-ce-k8s.git```
   5. terraform ```terraform init```
   6. terraform.tfvars 
      ``` 
       cluster_name = "k8s-cluster-example"
       aws_region = "eu-west-1"
       worker_type = "t3.medium"
       cluster_version = "1.17"
      ``` 
   7. run ```terraform plan```
   8. remove ```load_config_file = "false"```  line in  kubernetes.tf 
   9. run ```terraform plan``` 
   10. run ```terraform apply -auto-approve``` 
   11. install aws iam authenticator [IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
   12. set kubeconfig 
       ``` 
        mkdir -p $HOME/.kube
        sudo cp -i /home/ubuntu/thingsboard-ce-k8s/aws/eks/kubeconfig_eks-cluster $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config
       ``` 
   13. get nodes 
       ```
       kubectl get nodes
       ``` 
