class GamesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  before_action :only => [:new, :edit, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    @filter_type = params[:sort_by]
    # binding.pry
    if params[:sort_by] == nil
      @games = Game.alphabetical
    else
      @games = Game.send(params[:sort_by])
      if Game.send(params[:sort_by]) == []
        flash[:alert] = "No results returned. Choose another filter!"
      end
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
    flash[:notice] = "Game successfully added!"
      redirect_to  games_path
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game= Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "Game successfully updated!"
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.destroy
      flash[:notice] = "Game successfully removed!"
      redirect_to games_path
    end
  end

  private
  def game_params
    params.require(:game).permit(:name, :description, :price, :image, :genre, :platform)
  end
end
