class TaskMgmtPagesController < ApplicationController
  def home
  end

  def index
    @list = List.where(user: current_user)
  end
end
