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
      I18n.t('pages.reservation.collective_room_2'),
      I18n.t('pages.reservation.collective_room_4'),
      I18n.t('pages.reservation.collective_room_6'),
      I18n.t('pages.reservation.collective_room_10'),
      I18n.t('pages.reservation.double_room'),
      I18n.t('pages.reservation.suite_standard'),
      I18n.t('pages.reservation.suite_master_1'),
      I18n.t('pages.reservation.suite_master_2')
    ]
    @reservation = Reservation.new(:departure => Time.now.tomorrow)
    @page = Page.from_slug(:reservation)
  end

  def contact
    @page = Page.from_slug(:contact)
    @message = Message.new
  end
end