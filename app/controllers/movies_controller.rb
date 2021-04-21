class MovieController < ApplicationController
  before_action :set_assistant, only: [:create, :edit, :update, :destroy]
  before_action :set_movie, only: [:edit, :update, :destroy]

  def create
    @movie = @assistant.movies.create(movie_params)
    @movie.save
    redirect_to assistant_path(@assistant)
  end

  def edit
  end

  def update
    @movie.update(movie_params)

    redirect_to assistant_path(@assistant)
  end

  def destroy
    @movie.destroy
    
    redirect_to assistant_path(@assistant)
  end

  private
    def movie_params
      params.require(:movie).permit(:movie, :movies, :age, :country)
    end

    def set_assistant
      @assistant = Assistant.find(params[:assistant_id])
    end

    def set_movie
      @movie = @assistant.movies.find(params[:id])
    end
end