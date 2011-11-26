class Message
  include Mongoid::Document

  field :first_name, :type => String
  field :last_name, :type => String
  field :phone, :type => String
  field :country, :type => String
  field :email, :type => String
  field :message, :type => String

  validates_presence_of :first_name, :last_name, :message, :email
end