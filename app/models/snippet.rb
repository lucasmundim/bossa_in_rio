class Snippet
  include Mongoid::Document
  include Mongoid::Globalize

  field :section
  field :status, :type => Boolean, :default => true

  translates do
    field :body
  end

  has_many :photos, :as => :imageable

  embedded_in :page

  accepts_nested_attributes_for :translations

  validates_presence_of :section
  validates_uniqueness_of :section

  def rendered_body
    RedCloth.new(body).to_html
  end

  class << self
    def section(value)
      where(:section => value).first
    end
  end
end