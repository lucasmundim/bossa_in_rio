class MessagesController < ApplicationController
  def create
    if ignored_emails.blank? || !ignored_emails.include?(params[:message][:email])
      @message = Message.create(params[:message])
    end
  end

  private

  def ignored_emails
    (ENV['IGNORED_EMAILS'].presence || '').split(',')
  end
end
