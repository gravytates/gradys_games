class ReviewsController < ApplicationController
  # before_action :authorize, only: [:new, :create]

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @user = current_user
    @game = Game.find(params[:game_id])
    @review = @user.reviews.new(reviews_params)
    @user.reviews.push(@review)
    @game.reviews.push(@review)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @game = @review.game
    if @review.destroy
      flash[:notice] = "Review successfully removed!"
      redirect_to game_path(@game)
    end
  end

  private
    def reviews_params
      output = params.require(:review).permit(:body, :rating, :game_id)
    end
end
