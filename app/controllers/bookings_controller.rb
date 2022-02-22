class BookingsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @bookings = Booking.where(user: @user)
    else
      redirect_to root_path
    end
  end

  def new
    @booking = Booking.new
  end

  def create
  end
end
