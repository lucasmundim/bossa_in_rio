# encoding: UTF-8

class PagesController < ApplicationController
  def index
    @page = Page.from_slug(:home)
  end

  def hostel
    @page = Page.from_slug(:hostel)
  end

  def services
    @page = Page.from_slug(:services)
  end

  def facilities
    @page = Page.from_slug(:facilities)
  end

  def rooms
    @page = Page.from_slug(:rooms)
  end

  def dorms
    @page = Page.from_slug(:dorms)
  end

  def photos
    @page = Page.from_slug(:photos)
  end

  def location
    @page = Page.from_slug(:location)
  end

  def santa
    @page = Page.from_slug(:santa)
  end

  def reservation
    @reservation_types = [
      'Quarto coletivo de 2',
      'Quarto coletivo de 4',
      'Quarto coletivo de 6',
      'Quarto coletivo de 10',
      'Quarto Double',
      'Suíte Standard',
      'Suíte Máster 1',
      'Suíte Máster 2'
    ]
    @reservation = Reservation.new(:departure => Time.now.tomorrow)
    @page = Page.from_slug(:reservation)
  end

  def contact
    @page = Page.from_slug(:contact)
    @message = Message.new
  end
end