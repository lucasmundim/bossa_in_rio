class Snippet
  include Mongoid::Document

  field :section
  field :body
  
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