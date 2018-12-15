class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  # 新規登録後のリダイレクト先をマイページへ
    def after_sign_in_path_for(resource)
      if current_user.profile
        flash[:success] = "ログインに成功しました" #　 <-任意で
        root_url  #　指定したいパスに変更
      else
        flash[:success] = "新規登録完了しました。次に名前を入力してください" #　 <-任意で
        new_profile_path  #　指定したいパスに変更
      end
    end

    def count(user)
      @count_memos = user.memos.count
      @count_followings = user.followings.count
      @count_followers = user.followers.count
    end
    

end
