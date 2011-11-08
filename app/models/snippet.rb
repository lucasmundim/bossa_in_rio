class Snippet
  include Mongoid::Document

  field :section
  field :body

  def rendered_body
    RedCloth.new(body).to_html
  end

  class << self
    def section(value)
      where(:section => value).first
    end
  end
end