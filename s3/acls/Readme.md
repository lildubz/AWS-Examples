## create a new bucket

```sh
aws s3api create-bucket --bucket acl-example-ld-1234 --region us-east-1
```
## turn off block public access for acls

```sh
aws s3api put-public-access-block \
    --bucket acl-example-ld-1234 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-example-ld-1234
```

## Change bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-ld-1234 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user in another AWS account
```sh
aws s3api put-bucket-acl \
--bucket acl-example-ld-1234 \
--access-control-policy=file:///workspaces/AWS-Examples/s3/acls/policy.json
```

## Access bucket from other account

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-ld-1234
aws s3 ls s3://acl-example-ld-1234
```

## Cleanup

```sh
aws s3 rm s3://acl-example-ld-1234/bootcamp.txt
aws s3 rb s3://acl-example-ld-1234
```