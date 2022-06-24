class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @boards = current_user.board
  end

  def destroy
    if current_user.present?
      @boards = current_user.board
      @boards.each do |board|
        @group = Group.find_by(board_id: board.id, user_id: current_user.id)
      end
    end
    @group.destroy
    redirect_to boards_path
  end

  def invitation
    @user = User.find(params[:id])
    @boards = @user.board
    @group = Group.new(board_params)
    @group.user_id = @user.id
    if @group.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def board_params
    params.permit(:board_id)
  end
end
