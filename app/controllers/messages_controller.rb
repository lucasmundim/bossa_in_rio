class MessagesController < ApplicationController
  def create
    @message = Message.create(params[:message])
  end
end