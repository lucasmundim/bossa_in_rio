class ContactMailer < ActionMailer::Base
  default :from => "no-reply@bossainrio.com",
          :to => "lucas.mundim@gmail.com"
  
  def contact_email(message)
    @message = message
    replay_to = "#{message.first_name} #{message.last_name} <#{message.email}>"
    mail(:reply_to => replay_to,:subject => "Contato pelo site")
  end
end
