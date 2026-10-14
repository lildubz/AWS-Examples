## create a bucket

aws s3 mb s3://metadata-fun-ld-1234

## create a new file

echo "Hello Mars" > hello.txt

## upload file with metadata

aws s3api put-object --bucket metadata-fun-ld-1234 --key hello.txt --body hello.txt --metadata Planet=Mars

## get metadata through head object

aws s3api head-object --bucket metadata-fun-ld-1234 --key hello.txt

