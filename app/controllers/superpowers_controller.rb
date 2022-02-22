class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def new
  end

  def create
  end
end
