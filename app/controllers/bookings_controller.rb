class BookingsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @bookings = Booking.where(user_id: @user)
      if params[:no].present?
        @booking = Booking.find(params[:no])
        days = (@booking.end_date - @booking.start_date).to_i
        date = @booking.start_date.strftime("%d/%m/%Y")
        word = days > 1 ? "days" : "day"
        @cost = days * @booking.superpower.price
        @message = "Congratulations! You are now a wielder of #{@booking.superpower.name.capitalize} for #{days} #{word}, starting from #{date}!"
      end
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
      redirect_to bookings_path(no: @booking.id)
    else
      render 'superpowers/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @user = current_user
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
