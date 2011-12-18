class ReservationMailer < ActionMailer::Base
  default :from => "no-reply@bossainrio.com",
          :to => "reservas@bossainrio.com"
  
  def reservation_email(reservation)
    @reservation = reservation
    replay_to = "#{reservation.first_name} #{reservation.last_name} <#{reservation.email}>"
    mail(:reply_to => replay_to,:subject => "Contato pelo site")
  end
end
