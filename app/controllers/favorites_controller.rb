class FavoritesController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @favorite = Favorite.new(user_id: current_user.id, board_id: @board.id)
    @favorite.save
    redirect_to board_path(@board.id)
  end

  def destroy
    @board = Board.find(params[:board_id])
    @favorite = Favorite.find_by(user_id: current_user.id, board_id: @board.id)
    @favorite.destroy
    redirect_to board_path(@board.id)
  end
end
