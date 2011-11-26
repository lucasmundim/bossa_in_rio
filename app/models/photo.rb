class Photo
  include Mongoid::Document
  include Mongoid::Globalize

  mount_uploader :image, PhotoUploader

  translates do
    field :caption
  end

  has_and_belongs_to_many :pages
end