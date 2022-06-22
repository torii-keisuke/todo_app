class CardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @card = Card.new
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
  end

  def create
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @card = Card.new(card_params)
    if @card.save!
      redirect_to board_path(@board.id)
    else
      render action: :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @lists = List.where(board_id: @board.id)
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.task = params[:card][:task]
    @card.list_id = params[:card][:list_id]
    if @card.save
      redirect_to board_path(params[:board_id])
    else
      render action: :edit
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @list = List.find(params[:list_id])
    @card = Card.find(params[:id])
    if @card.destroy
      redirect_to board_path(params[:board_id])
    else
      render action: :edit
    end
  end

  private

  def card_params
    params.require(:card).permit(:task, :content, :list_id).merge(list_id: @list.id)
  end
end
