#!/bin/bash

# Enable GCP API
gcloud services enable \
    container.googleapis.com \
    containerregistry.googleapis.com \
    cloudapis.googleapis.com \
    iam.googleapis.com \
    iamcredentials.googleapis.com \
    storage-api.googleapis.com \
    storage-component.googleapis.com

# Create Cluster
gcloud beta container clusters create $CLUSTER_NAME \
    --zone $ZONE \
    --machine-type=n1-standard-2

# Create Google Storage bucket
gsutil mb -l $REGION -p $PROJECT_ID gs://$BUCKET/

# Create Service Account and generate .json
gcloud iam service-accounts create $IAM_SERVICE \
    --display-name=$IAM_SERVICE

gcloud iam service-accounts keys create \
    --iam-account "$IAM_SERVICE@$PROJECT_ID.iam.gserviceaccount.com" config/$IAM_SERVICE.json