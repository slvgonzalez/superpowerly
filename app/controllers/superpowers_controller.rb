class SuperpowersController < ApplicationController
  def index
    @search = params["search"]
    if @search.present? && @search["name"] != ""
      @result = @search["name"]
      all_out_search = Superpower.search_for_spowers_by_name_descr_cat_user(@result)
      id = current_user.id
      spowers1 = Superpower.where(user_id: id)
      @superpowers = all_out_search - spowers1
    else
      @superpowers = Superpower.all
      id = current_user.id
      if Superpower.find_by(user_id: id)
        @message = "Some powers you are renting out like the sell-out you are:"
      else
        @message = "We all have superpowers, yours could be on this list too!"
      end
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
    @superpower.rating = 1.0
    if @superpower.save!
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name, :price, :description, :category, :photo, :rating)
  end
end
