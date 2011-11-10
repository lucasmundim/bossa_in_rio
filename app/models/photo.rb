class Photo
  include Mongoid::Document
  mount_uploader :image, PhotoUploader

  field :caption

  has_and_belongs_to_many :pages
end