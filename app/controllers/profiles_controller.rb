class ProfilesController < ApplicationController

  def new
      #インスタンス作ったのみ
     @profile = current_user.build_profile
  end
  
  def create
     @profile = current_user.build_profile(profile_params) #ログインしているユーザのprofile
     @profile.assign_attributes(profile_params) #.assign_attributes変更するだけで保存はしない。フォームから送られてきた値（profile_params）を保存できなかった場合、記入していた文字がそのまま残ってrenderされる
     if @profile.save
       flash[:success] = "名前を登録しました"
       redirect_to root_url
      else
       flash[:danger] = "舐めの登録に失敗しました"
       render :edit
     end
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:name)
  end
end