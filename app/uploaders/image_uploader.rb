class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "http://www.placecage.com/c/300/300"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
