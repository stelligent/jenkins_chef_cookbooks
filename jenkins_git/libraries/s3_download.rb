def download_s3_bucket_to_local_dir(s3_bucket_name, local_dir)
  require 'aws-sdk'
  #no creds - rely on instance profile
  s3 = AWS::S3.new

  obj = s3.buckets[s3_bucket_name].objects.each do |cred|
    File.open("#{local_dir}/#{cred.key}", 'wb') do |file|
      cred.read do |chunk|
        file.write(chunk)
      end
    end
  end
end

