class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #devise入れているのでcurrent_user使用。@user = User.find(params[:id])だと他のユーザからも見れてしまうので。
    @user = current_user
  end
end
