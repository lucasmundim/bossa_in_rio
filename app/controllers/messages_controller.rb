class MessagesController < ApplicationController
  def create
    if !ignored?(params[:message])
      @message = Message.create(params[:message])
    end
  end

  private

  def ignored?(message)
    ignored_email?(message[:email]) || ignored_name?(message[:first_name], message[:last_name])
  end

  def ignored_email?(email)
    ignored_emails.present? && ignored_emails.include?(email)
  end

  def ignored_name?(first_name, last_name)
    ignored_names.present? && ignored_names.include?("#{first_name.try(:downcase)}-#{last_name.try(:downcase)}")
  end

  def ignored_emails
    (ENV['IGNORED_EMAILS'].presence || '').split(',').map(&:downcase)
  end

  def ignored_names
    (ENV['IGNORED_NAMES'].presence || '').split(',').map(&:downcase)
  end
end
