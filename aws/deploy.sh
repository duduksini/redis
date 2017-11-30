#!/bin/bash -ex

StackName=duduksini-redis
Template=cf.yml
Region=eu-west-1

# upload seed
aws s3 sync ../data s3://duduksini/redis/seed/ --acl public-read --sse AES256

# deploy redis
aws cloudformation deploy --template-file $Template --stack-name $StackName --capabilities CAPABILITY_IAM --region $Region
