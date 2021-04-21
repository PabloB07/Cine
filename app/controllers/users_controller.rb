class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @assistant = Assistant.find(params[:assistant_id])
    @user = @assistant.users.create(user_params)
      redirect_to assistant_path(@assistant)
  end


  def destroy
    @assistant = Assistant.find(params[:id])
    @user = @assistant.users.find(params[:assistant_id])
    @user.destroy
      redirect_to assistant_path(@assistant)
  end


  private
    def user_params
      params.require(:assistant).permit(:name, :message)
    end
end