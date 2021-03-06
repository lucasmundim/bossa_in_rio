class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :first_name, :type => String
  field :last_name, :type => String
  field :country, :type => String
  field :email, :type => String
  field :message, :type => String

  validates_presence_of :first_name, :message, :email
  validates :email, :email => true

  after_create :mail

  private
    def mail
      ContactMailer.contact_email(self).deliver
    end
end