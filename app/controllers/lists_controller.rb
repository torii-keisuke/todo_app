class ListsController < ApplicationController
  def new
    @list = List.new
  end


  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # ボードのIDがないと作成できない
      redirect_to root_url
    else
      render action: :new
    end
  end

  def destroy
  end

  private

    def list_params
      params.require(:list).permit(:content)
    end

end
