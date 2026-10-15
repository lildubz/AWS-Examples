## create a bucket

```sh
aws s3 mb s3://bucket-policy-example-ld-1234
```
## create bucket policy

```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-ld-1234 --policy file://policy.json
```

## in the other account, access the bucket

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-ld-1234
aws s3 ls s3://bucket-policy-example-ld-1234
```

## cleanup
```sh
aws s3 rm s3://bucket-policy-example-ld-1234/bootcamp.txt
aws s3 rb s3://bucket-policy-example-ld-1234
```
