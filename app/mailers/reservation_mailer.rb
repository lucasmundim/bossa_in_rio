class ReservationMailer < ActionMailer::Base
  default :from => "no-reply@bossainrio.com",
          :to => "reservas@bossainrio.com"
  
  def reservation_email(reservation)
    @reservation = reservation
    replay_to = "#{reservation.first_name} #{reservation.last_name} <#{reservation.email}>"
    mail(:reply_to => replay_to, :subject => "Reserva pelo site - #{I18n.l Time.now, :format => :custom_with_time}")
  end
end
