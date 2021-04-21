class MovieController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def create
    @movie = @assistant.movies.create(movie_params)
    @movie.save
    redirect_to assistant_path(@assistant)
  end

  def destroy
    @movie.destroy
    
    redirect_to assistant_path(@assistant)
  end

  def show
    @movie = Movie.find(params[:id])
  end
  private
    def movie_params
      params.require(:movie).permit(:movie, :movies, :age, :country)
    end
end