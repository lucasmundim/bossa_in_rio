class Photo
  include Mongoid::Document
  include Mongoid::Globalize

  mount_uploader :image, PhotoUploader

  field :order, :default => 0

  translates do
    field :caption
  end

  scope :ordered, order_by(:order.asc)

  belongs_to :imageable, :polymorphic => true
end