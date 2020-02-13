# README.md

There are some expectations if you are to follow/use this example here.

## AWS Credentials / Config
You should add the following to your $HOME/.aws/credentials - which will be referenced by your providers.tf file
```
[awsgc-jradtke]
aws_access_key_id = ACCESS_KEY_ID 
aws_secret_access_key = SECRET_ACCESS_KEY
region = us-gov-west-1
```

## Git foo
I am not going in to great detail here, but - I recommend you ignore terraform.state* and .terraform directory for Git.   Check out my [Git Cheatsheet](https://github.com/cloudxabide/devops/blob/master/Foo/git_cheatsheet.md#git-ignore) for how I do it.

## Terraform Statefile(s) Management
I haven't looked in to this, but I certainly don't want state files lingering in my git-managed directory.  :-(  More to come, hopefully.

## Filename standards
I am still learning how Terraform works (which has been pretty great to learn, thus far).  So, hopefully I am naming my files correctly.

## Let's do this 
### Providers
You should create your [providers.tf](providers.tf) file to resemble my example.

### Variables
the create [variables.tf](variables.tf)

### Initiatlize Terraform 
Then you can Initialize your terraform project
```
terraform init
```

### Infstructure Code
Create vpc.tf to define all of the "vpc based" resources.

