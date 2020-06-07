# K8S with Google Storage


## Idea
Connect Google Storage bucket as Persisten Volume

## GCP setup
1. Export your PROJECT_ID
    ```
    export PROJECT_ID=your-project-id
    ```
1. Authorize your GCP account
    ```
    gcloud auth login
    gcloud config set project $PROJECT_ID
    ```
1. Export ENV variables
    ```
    source config/config.tpl
    export $(cut -d= -f1 config/config.tpl)
    ```
1. Create all necessary services
    ```
    . gcp/setup.sh
    ```

## K8S setup
1. Install [skaffold](https://skaffold.dev/docs/install/) library
    ```
    curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
    sudo install skaffold /usr/local/bin/
    ```
1. Modify following files according to your env variables:
    - `kubernetes/backend/backend.deployment.yaml`
    - `kubernetes/nfs-bucket/nfs-bucket.controller.yaml`
1. Run k8s using skaffold library:
    ```
    skaffold dev
    ```

## Resources
- [Mounting a GCP bucket as NFS in kubernetes](https://medium.com/grensesnittet/mounting-a-gcp-bucket-as-nfs-in-kubernetes-8f6d3faf4da3)
- [Using Google Cloud Service Accounts on GKE](https://blog.realkinetic.com/using-google-cloud-service-accounts-on-gke-e0ca4b81b9a2)
- [Multi-Writer File Storage on GKE](https://estl.tech/multi-writer-file-storage-on-gke-6d044ec96a46)
- [Create ReadWriteMany PersistentVolumeClaims on your Kubernetes Cluster](https://medium.com/asl19-developers/create-readwritemany-persistentvolumeclaims-on-your-kubernetes-cluster-3a8db51f98e3)