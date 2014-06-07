# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage (Rails.env.production? ? :fog : :file)
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  process :resize_to_fit => [800, 800]

  version :panel do
    process :resize_to_fill => [312, 260]
  end

  version :thumb_408x230 do
    process :resize_to_fill => [408, 230]
    process :quality => 75
  end

  version :thumb_330x230 do
    process :resize_to_fill => [306, 230]
    process :quality => 75
  end

  version :thumb_205x116 do
    process :resize_to_fill => [205, 116]
    process :quality => 75
  end

  version :thumb_266x150 do
    process :resize_to_fill => [266, 150]
    process :quality => 75
  end

  version :thumb_120x120 do
    process :resize_to_fill => [120, 120]
    process :quality => 75
  end

  version :thumb_260x120 do
    process :resize_to_fill => [260, 120]
    process :quality => 75
  end

  version :thumb_266x150 do
    process :resize_to_fill => [266, 150]
    process :quality => 75
  end

  version :thumb_117x227 do
    process :resize_to_fill => [175, 227]
    process :quality => 75
  end

  version :thumb_97x97 do
    process :resize_to_fill => [97, 97]
    process :quality => 75
  end

  version :thumb do
    process :resize_to_fill => [90, 90]
    process :quality => 75
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
