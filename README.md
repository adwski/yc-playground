## Synopsis

Recipies to bootstrap various stuff in Yandex Cloud.

Terraform projects use object storage to persist state. Bucket and credentials can be configured like this:
```bash
# create bucket
yc storage bucket create --name some-bucket-name
# create service account
yc iam service-account create --name some-terraform-sa
# add s3 permissions to service account
yc resource-manager folder add-access-binding --id <your-folder-id> --role storage.uploader --subject serviceAccount:<created-service-account-id>
# generate static access and secret keys
yc iam access-key create --service-account-name some-bucket-name
```

at the moment there's only one project with zonal k8s cluster.
