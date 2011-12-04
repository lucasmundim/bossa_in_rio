class Photo
  include Mongoid::Document
  include Mongoid::Globalize

  mount_uploader :image, PhotoUploader

  translates do
    field :caption
  end

  belongs_to :imageable, :polymorphic => true
end