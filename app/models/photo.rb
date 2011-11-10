class Photo
  include Mongoid::Document
  mount_uploader :image, PhotoUploader

  field :caption
end