class Reservation
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  field :arrival, :type => DateTime
  field :departure, :type => DateTime
  field :room, :type => String
  field :quantity, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :identification, :type => String
  field :genre, :type => String
  field :nationality, :type => String
  field :email, :type => String
  field :wants_transfer, :type => String
  field :transfer_details, :type => String
  field :address, :type => String
  field :city, :type => String
  field :phone, :type => String
  field :mobile, :type => String
  field :obs, :type => String
  field :reference, :type => String

  validates_presence_of :first_name, :last_name, :email
end