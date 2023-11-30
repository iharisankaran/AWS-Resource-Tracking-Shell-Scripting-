#!/bin/bash

#####################################################
# Author : Harisankaran
# MailTo : harisankaran204@gmail.com
# Github : iharisankaran
# linkedin : harisankaran-sekar
# Date : 28/11/2023
# Version : v1.0

####################################################

# This Script will report the AWS resource usage 

# AWS EC2
# AWS S3
# AWS Lambda
# AWS IAM User

#####################################################

set -x

# EC2 List
echo "List of EC2 Instances"
aws ec2 describe-instances | jq ".Reservations[].Instances[].InstanceId" > resourceTracker.txt 

# S3 list
echo "List of S3 Buckets"
aws s3 ls >> resourceTracker.txt

# Lambda List
echo "List of Lambda Functions"
aws lambda list-functions >> resourceTracker.txt

# IAM List
echo "List of IAM Users"
aws iam list-users | jq ".Users[].UserName" >> resourceTracker.txt
