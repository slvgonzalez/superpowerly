class SuperpowersController < ApplicationController
  def index
    @search = params["search"]
    if @search.present? && @search["name"] != ""
      @result = @search["name"]
      Superpowers.search_for_spowers_by_name_descr_cat_user(@result)
      id = current_user.id
      # spowers1 = Superpower.where(user_id: id)
      # spowers2 = Superpower.where("name ILIKE ?", "%#{@name}%")
      # @superpowers = spowers2 - spowers1
    else
      @superpowers = Superpower.all
      @message = "Some powers you are renting out like a sell-out you are:"
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
