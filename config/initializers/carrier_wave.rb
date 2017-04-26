# require 'carrierwave/orm/activerecord'
#
# CarrierWave.configure do |config|
#
# config.fog_credentials = {
#     :provider               => 'AWS',
#     :aws_access_key_id      => ENV['S3_KEY'],
#     :aws_secret_access_key  => ENV['S3_SECRET'],
#     :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
# }
# config.fog_directory  = ENV['S3_BUCKET']
#
# end
# 
#
#
# module CarrierWave
#   module MiniMagick
#     def quality(percentage)
#       manipulate! do |img|
#         img.quality(percentage.to_s)
#         img = yield(img) if block_given?
#         img
#       end
#     end
#   end
# end
