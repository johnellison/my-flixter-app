if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
end

if Rails.env.test?
  # auto load uploaders
  ImageUploader
  VideoUploader

  # use different dirs when testing
    CarrierWave::Uploader::Base.descendants.each do |klass|
      next if klass.anonymous?
      klass.class_eval do
        def cache_dir
          "#{Rails.root}/test/factories/uploads/tmp"
        end

        def store_dir
          "#{Rails.root}/test/factories/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
        end
      end
    end
end  

else
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV['AWS_BUCKET']
    config.aws_acl    = :public_read

    config.aws_credentials = {
      access_key_id:     ENV['AWS_ACCESS_KEY'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }
  end
end
