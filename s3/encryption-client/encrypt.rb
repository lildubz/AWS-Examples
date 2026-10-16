require 'aws-sdk-s3'
require 'openssl'
key = OpenSSL::Cipher.new('aes-256-gcm').random_key

bucket = 'encrypt-client-fun-ld-1234'


# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
    encryption_key: key,
    key_wrap_schema: :aes_gcm,
    content_encryption_schema: :aes_gcm_no_padding,
    security_profile: :v2
)

# round-trip an object, encrypted/decrypted locally
s3.put_object(bucket: bucket, key: 'hello.txt', body:'handshake')
puts s3.get_object(bucket: bucket, key: 'hello.txt').body.read
#=> "handshake"

# reading encrypted object without the encryption client
# results in getting the ciipher text
puts Aws::S3::Client.new.get_object(bucket: bucket, key: 'hello.txt').body.read