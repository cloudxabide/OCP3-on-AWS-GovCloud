# Sign Up for GovCloud

## Docs
[Signing Up for AWS GovCloud (US)](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/getting-started-sign-up.html)

You will receive an email from AWS indicating you have applied:  
Subject: AWS GovCloud (US) Access Request Received

Then, if all goes well, you will receive another email:  
Subject: AWS GovCloud (US) Access Approved!

It was about 2 hours before my account was approved.

Side Note (which is hopefully limited in actual scope) I received the email that my account was approved and followed the instructions to set my "Administrator" password on the account.

## Account Management

### Updating your console URL
Browse to the [GovCloud Console](https://console.amazonaws-us-gov.com/iam/home?region=us-gov-west-1#/home) and then the [IAM Dashboard](https://console.amazonaws-us-gov.com/iam/home?region=us-gov-west-1).  Under the header: Welcome to Identity and Access Management | IAM users sign-in link: located the link to "Customize" and enter whatever alias you like.  

https://clouditoutload.signin.amazonaws-us-gov.com/console


### Programmatic Access
So, you need to access specific EndPoints for the AWS CLI.
Follow [GovCloud - Command Line and API Access](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/cli-and-api-access.html) which directs you to a blackhole (I'm sure the data is there somewhere - I'll save you the time.

In your ~/.aws/credentials (or config) add one of the following regions:  
us-gov-west-1  
us-gov-east-1

```
[Administrator]
aws_access_key_id = MYACCESSKEYID
aws_secret_access_key = MYSECRETACCESSKEY
region = us-gov-west-1
```

Test your AWS CLI configuration update.
```
export AWS_DEFAULT_PROFILE="Administrator"
aws ec2 describe-vpcs
```




NOTE:  This is current as of Q4-2019.

