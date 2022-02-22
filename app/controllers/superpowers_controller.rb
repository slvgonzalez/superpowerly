class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    # we need `user_id` to associate superpower with corresponding user?
    @user = User.find(params[:user_id])
    @user.superpower = @superpower
    @superpower.save!
    redirect_to superpowers_path(@user)
  end
  private

  def superpower_params
    params.require(:superpower).permit(:name, :price, :description, :user_id)
  end
end
