class ProfilesController < ApplicationController

  def new
      #インスタンス作ったのみ
     @profile = current_user.build_profile
  end
  
  def create
     @profile = current_user.build_profile(profile_params)
    #  @profile.assign_attributes(profile_params) 
     if @profile.save
       flash[:success] = "名前を登録しました"
       redirect_to root_url
      else
       flash[:danger] = "名前の登録に失敗しました"
       render :edit
     end
  end
  
  private
  
  def profile_params
    params.require(:profile).permit(:name)
  end
end