#!/bin/bash

# ---- ARGUMENTS ---

SSH_CERT=~/Downloads/bastion.pem
BASTION_NAME=db-bastion
BASTION_USER=ubuntu
DB_PORT=27017
DB_URL=docdb-2021-06-15-10-32-01.co9gnygxdoul.us-east-1.docdb.amazonaws.com

# ----- SCRIPT -----

IP=`aws ec2 describe-instances --filters "Name=tag:Name,Values=$BASTION_NAME" | jq -r '.Reservations[].Instances[].NetworkInterfaces[].Association.PublicIp'`
echo "Tunneling through bastion at $IP"

CMD="ssh -i $SSH_CERT -L $DB_PORT:$DB_URL:$DB_PORT $BASTION_USER@$IP -N"
echo $CMD

ssh -i $SSH_CERT -L $DB_PORT:$DB_URL:$DB_PORT $BASTION_USER@$IP -N
