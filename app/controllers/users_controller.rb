class UsersController < ApplicationController

  def show

  end

  def create
    @group = Group.find(params[:group_id])
    @user = User.find_by(email: params[:email])
    @group.users << @user
    redirect_to @group
  end

end
