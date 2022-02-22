class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
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
