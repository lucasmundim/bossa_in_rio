class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.create(params[:reservation])
  end
end