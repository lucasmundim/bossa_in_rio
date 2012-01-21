class ContactMailer < ActionMailer::Base
  default :from => "no-reply@bossainrio.com",
          :to => "contato@bossainrio.com"
  
  def contact_email(message)
    @message = message
    replay_to = "#{message.first_name} #{message.last_name} <#{message.email}>"
    mail(:reply_to => replay_to, :subject => "Contato pelo site - #{I18n.l Time.now, :format => :custom_with_time}")
  end
end
