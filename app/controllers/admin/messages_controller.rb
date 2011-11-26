class Admin::MessagesController < Admin::ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to admin_messages_path
  end
end
