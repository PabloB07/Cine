class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
  if @user.save
      redirect_to @user
  else
      render :new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  
    redirect_to @user
  end

  def update
  if @user.update(user_params)
    redirect_to @user
  else
    render :edit
  end

  private
    def user_params
      params.require(:user).permit(:username, :age, :country, movie_attributes: [:user_id, :movie, :description, :movies, :price])
    end
  end
end
end
