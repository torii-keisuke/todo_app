class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def index
    @boards = Board.all
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      Group.create(user_id: current_user.id, board_id: @board.id)
      redirect_to boards_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render action: :edit
    end
  end

  def join
    @board = Board.find(params[:group_id])
    @board.users << current_user
    redirect_to boards_path
  end

  def destroy
    @board = Board.find(params[:id])
    @group.user.delete(current_user)
    redirect_to boards_path
  end

  private

    def board_params
      params.require(:board).permit(:title)
    end
end
