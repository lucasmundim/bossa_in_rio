class Photo
  include Mongoid::Document

  mount_uploader :image, PhotoUploader

  field :order, :default => 0
  field :thumb_version, :default => "thumb"

  field :caption, localize: true

  scope :ordered, -> { order_by(:order.asc) }

  belongs_to :imageable, :polymorphic => true

  validates_presence_of :image, on: :create

  def image_thumb_version
    if thumb_version and image.versions.keys.include? thumb_version.to_sym
      image.send(thumb_version)
    else
      image.thumb
    end
  end
end
