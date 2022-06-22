class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @board = Board.find(params[:board_id])
  end

  def create
    @board = Board.find(params[:board_id])
    @list = List.new(list_params)
    if @list.save
      redirect_to board_path(@board.id)
    else
      render action: :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.content = params[:list][:content]
    if @list.save
      redirect_to board_path(params[:board_id])
    else
      render action: :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to board_path(params[:board_id])
    else
      render action: :edit
    end
  end

  private

  def list_params
    params.require(:list).permit(:content).merge(board_id: @board.id)
  end

end
