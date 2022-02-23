class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
    @search = params["search"]
    if @search.present? && @search["name"] != ""
      @name = @search["name"]
      id = current_user.id
      spowers1 = Superpower.where(user_id: id)
      spowers2 = Superpower.where("name ILIKE ?", "%#{@name}%")
      @superpowers = spowers2 - spowers1
    end
  end

  def show
    @superpower = Superpower.find(params[:id])
    @booking = Booking.new
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    # we need `user_id` to associate superpower with corresponding user?
    @user = current_user
    @superpower.user = @user
    if @superpower.save!
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name, :price, :description, :photo)
  end
end
