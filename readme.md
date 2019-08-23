## About
This repo is used to deploy resources for a frontend application (Angular, React, Vue, etc.) to run via CloudFront. In order to do that, an S3 bucket is created for the production build files and is protected so that the resources can only be accessed through the CloudFront service. This is accomplished with a CloudFront Access Identity. A Route 53 record is created and linked to the CloudFront service as well. ACM is required for SSL, and if you have a certificate in US-East-1 that covers the domain that will serve the CloudFront distribution, you can use that ARN in the main variable file, or you can uncomment the ACM module and use its output ARN instead.

This Terraform config also assumes that Route 53 is already set up for the domain you wish to use, so we set the domain's zone ID in the variables file in order to reference it. The domain's hosted zone is not managed in this config.

## Setup
Set the following values in `variables.tf`
- aws-region
- deployment-env
- domain
    - Your domain for the ACM certificate. This will be validated by email in this configuration.
- alerternative-domains
    - An array of other domains (subdomains) that you want the certificate to cover.
- bucket-name
    - Unique S3 Bucket name for storage.
- bucket-description
- access-identity-description
- acm-certificate-arn
    - Specify this is you already have a certificate in US-East-1 that covers your domain that you wish to use. Otherwise, use the one generated in the ACM module.
- cloudfront-description
- cloudfront-origin
    - A unique origin name identifier
- cloudfront-alias
    - The domain, or subdomain you want your app to be hosted on.
- route53-zone-id
    - The zone ID for the domain's hosted zone in AWS. Set this if your domain has already been created and is not managed by Terraform.
- route53-record-name
    - The subdomain name for your app (it can be blank for the domain itself).

Lastly, you can change the name of the resources in the modules to match your style.

## Usage
Send your production frontend application files to the S3 bucket in whichever manner you wish. If you're doing it manually via npm, you can use the following two commands.

#### Build the production application
- `npm run build`

#### Deploy the production application
Add this to your application's `package.json` script section.
- `"deploy": "aws s3 sync build/ s3://myunique-bucket-name --delete"`

Then run the following command to upload the build files.
- `npm run deploy`