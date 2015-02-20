if Rails.env.development? or Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('AWS_BUCKET')
    config.aws_acl    = :public_read

    config.aws_credentials = {
      access_key_id:     ENV.fetch('AWS_ACCESS_KEY'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }
  end
end
