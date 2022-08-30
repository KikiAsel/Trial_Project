# Fearless Trial Project

## Dependencies
- [terraform](https://www.terraform.io/docs/cli/commands/index.html)
- [awscli](https://aws.amazon.com/cli/)
- [awssamcli](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)
- [serverless](https://www.serverless.com/framework/docs/getting-started)
- [Set up AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)


## How I build and run the solution

The AWS environment is built in the `us-east-1` region of AWS

- Created an Infrastructure as Code using Terraform
- Installed Serverless Framework and created a dev project
- Updated python script to include get_SSL_Expiry_Date function to get expiration date
- Tested python module locally in VSCode terminal
- Ran Terraform command to compile and deploy Lambda function
