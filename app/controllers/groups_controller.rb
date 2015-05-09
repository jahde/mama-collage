class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def deals

  end

  def create
    @group = Group.create(name: params[:name])
    redirect_to @group
  end
end
