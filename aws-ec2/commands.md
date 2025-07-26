Inorder to use terraform follow the following steps

- add your cloud IAM credentails to your system
- add them in an .env file and run command
  ```
      Source .env
  ```
- then write your IAC with terraform
- initialize your terraform with init command
  ```
      terraform init
  ```
- check what all changes are going to be applied
  ```
      terraform plan
  ```
- apply all changes
  ```
      terraform apply
  ```
- destroy all changes made via a .tf file
  ```
      terraform destroy
  ```
- to check if my terraform file is valid
  ```
   terraform validate
  ```

There is no concept of import and export in terraform. Just all the files must stay in same folder

defining a variables

```
    variable "name" {
        type= <dtype>
        description="<about_the_variable>"
        default = <default_value>
    }
```
