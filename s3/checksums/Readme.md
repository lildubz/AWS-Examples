## create a new s3 s3 bucket

```md
aws s3 mb s3://checksums-exmaples-ld-1234
```

## create a file that we will do a checksum on

```
echo "Hello Mars" > myfile.txt

```

## get a checksum of a file

```
md5sum myfile.txt

# 8ed2d86f12620cdba4c976ff6651637f  myfile.txt
```

## upload our s3 file and look at its etag

```
aws s3 cp myfile.txt s3://checksums-exmaples-ld-1234
aws s3api head-object --bucket checksums-exmaples-ld-1234 --key myfile.txt
```

## Lets upload a file with a different kind of checksum

```sh
sudo apt install rhash -y
rhash --crc32 --simple myfile.txt
```


```sh
aws s3api put-object \
--bucket="checksums-exmaples-ld-1234" \
--key="myfilecrc32.txt" \
--body="myfile.txt" \
--checksum-algorithm="CRC32" \
--checksum-crc32="58gLhw=="

```

