class Page
  include Mongoid::Document

  field :slug

  embeds_many :snippets

  accepts_nested_attributes_for :snippets

  class << self
    def from_slug(slug)
      where(:slug => slug).first
    end
  end
end