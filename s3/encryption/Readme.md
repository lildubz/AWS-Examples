## Create a bucket

```sh
aws s3 mb s3://encryption-fun-ld-1234
```

## Create a file and put object with encryption SSE-S3

```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-ld-1234
```

### Put object with encryption of KMS

```sh
aws s3api put-object \
--bucket encryption-fun-ld-1234 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id fcff60de-1325-4acc-958f-a63f6e7d8e1f
```


### Put Object with SSE-C

## Newer S3 Buckets block SSE-C by default, update bucket's encryption config

```sh
aws s3api put-bucket-encryption --bucket encryption-fun-ld-1234 \
--server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"},"BlockedEncryptionTypes":{"EncryptionType":["NONE"]}}]}'
```

```sh
export SSE_KEY=$(openssl rand -hex 16)   # 32 characters = 32 bytes
echo $SSE_KEY

aws s3api put-object \
--bucket encryption-fun-ld-1234 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $SSE_KEY

```