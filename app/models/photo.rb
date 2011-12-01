class Photo
  include Mongoid::Document
  include Mongoid::Globalize

  mount_uploader :image, PhotoUploader

  field :tags, :type => Array, :default => []

  translates do
    field :caption
  end

  index :tags

  def tags_data
    tags.join("\n")
  end

  def tags_data=(value)
    self.tags = value.split("\n").map(&:strip)
  end

  class << self
    def by_tags(*args)
      where(:tags.in => args)
    end

    def grouped_by_tags(tags)
      tags.inject({}) do |result, tag|
        photos = where(:tags => tag)
        result[tag] = photos if photos.present?
        result
      end.tap do |result|
        photos = where(:tags.nin => tags)
        result[''] = photos if photos.present?
      end
    end
  end
end