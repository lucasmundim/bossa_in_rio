class Page
  include Mongoid::Document

  field :slug

  embeds_many :snippets

  accepts_nested_attributes_for :snippets

  validates_presence_of :slug
  validates_uniqueness_of :slug

  class << self
    def from_slug(slug)
      where(:slug => slug).first
    end
  end
end