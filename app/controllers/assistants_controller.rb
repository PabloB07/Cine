class AssistantsController < ApplicationController
  # index
  def index
    @assistants = Assistant.all
  end

  # create
  def create
    @movie = Movie.find(params[:movie_id])
    @assistant = @movie.assistants.create(assistant_params)
    redirect_to movie_assistant_path(@movie, @assistant)
  end

  # destroy
  def destroy
    @assistant = Assistant.find(params[:id])
    @assistant.destroy
    redirect_to assistants_path
  end
  def show
    @assistant = Assistant.find(params[:id])
  end
  private

  def assistant_params
    params.require(:assistant).permit(:name, :message)
  end
end