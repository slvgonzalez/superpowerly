class BookingsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @bookings = Booking.where(user_id: @user)
    else
      redirect_to superpowers_path
    end
  end

  def new
    @user = current_user
    @superpower = Superpower.find(params[:superpower_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @superpower = Superpower.find(params[:superpower_id])
    @booking = Booking.new(strong_params)
    @booking.superpower = @superpower
    @booking.user = @user
    if @booking.save
      @user = current_user
      redirect_to bookings_path
    else
      @err = "error"
      render 'superpowers/show'
    end
  end

  private

  def strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
