## Create Website 1

## Create a bucket

```sh
aws s3 mb s3://cors-fun-ld-1234
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-fun-ld-1234 \
--public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": false, "RestrictPublicBuckets": false}'
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-fun-ld-1234 --policy file://bucket-policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-fun-ld-1234 --website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross-origin

```sh

aws s3 cp index.html s3://cors-fun-ld-1234

```

## View the website and see if index.html is there

http://cors-fun-ld-1234.s3-website-us-east-1.amazonaws.com

## Create Website 2

## Create a bucket

```sh
aws s3 mb s3://cors-fun-ld2-1234
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-fun-ld2-1234 \
--public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": false, "RestrictPublicBuckets": false}'
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-fun-ld2-1234 --policy file://bucket-policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-fun-ld2-1234 --website-configuration file://website.json
```

## Upload our javascript file

```sh

aws s3 cp hello.js s3://cors-fun-ld2-1234

```


## View the website and see if index.html is there

http://cors-fun-ld2-1234.s3-website-us-east-1.amazonaws.com

## Create API Gateway with mock response and then test the endpoint

curl -X POST -H "Content-Type: application/json" https://391d5bful6.execute-api.us-east-1.amazonaws.com/prod/hello

## Set CORS on our bucket

aws s3api put-bucket-cors --bucket cors-fun-ld-1234 --cors-configuration file://cors.json




