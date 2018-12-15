class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #devise入れているのでcurrent_user使用。@user = User.find(params[:id])だと他のユーザからも見れてしまうので。
    @user = User.find(params[:id])
    @memos = @user.memos.order('created_at DESC').page(params[:page])
  end
  
  def followings
    @user = current_user
    @followings = current_user.followings.page(params[:page])
    count(current_user)
  end
  
  def followers
    @user = current_user
    @followers = current_user.followers.page(params[:page])
    count(current_user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, password_confirmation)
  end
  
end