class Reservation
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps::Created

  attr_accessor :arrival_text, :transfer_arrival_text, :departure_text, :terms_and_conditions

  field :arrival, :type => DateTime
  field :arrival_time, :type => String
  field :departure, :type => DateTime
  field :room, :type => String
  field :quantity, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :identification, :type => String
  field :gender, :type => String
  field :nationality, :type => String
  field :email, :type => String
  field :wants_transfer, :type => String
  field :transfer_arrival, :type => DateTime
  field :transfer_arrival_time, :type => String
  field :transfer_origin, :type => String
  field :transfer_flight_number, :type => String
  field :address, :type => String
  field :city, :type => String
  field :phone, :type => String
  field :mobile, :type => String
  field :obs, :type => String

  validates_presence_of :first_name, :last_name, :email
  validates_acceptance_of :terms_and_conditions, :accept => 'yes'

  after_create :mail

  private
    def mail
      ReservationMailer.reservation_email(self).deliver
    end
end