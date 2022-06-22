class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if current_user.present?
      @boards = current_user.board
    end
  end

  def new
    @board = Board.new
  end

  def create
    #ログインしていないユーザーはboards/newページに行けないようにする。
    @board = Board.new(board_params)
    if @board.save
      Group.create(user_id: current_user.id, board_id: @board.id)
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @lists = List.where(board_id: params[:id])
    @lists.each do |list|
      @cards = Card.where(list_id: list.id)
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.title = params[:board][:title]
    if @board.save
      redirect_to board_path(params[:id])
    else
      render action: :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
      redirect_to boards_path
    else
      render action: :edit
    end
  end

  def join
    @board = Board.find(params[:group_id])
    @board.users << current_user
    redirect_to root_path
  end

  private

    def board_params
      params.require(:board).permit(:title)
    end
end
