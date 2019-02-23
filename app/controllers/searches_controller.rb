class SearchesController < ApplicationController
    
 def index
    search_name = params[:name] unless params[:name] == " " || params[:name] == "全員"
    search_date = params[:date] unless params[:date] == ""
    # 名前と日付がある時
    if search_name && search_date
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos.where(recorded_on: search_date.to_date)
    # 名前だけの時はそのユーザの投稿全て表示
    elsif search_name
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos
    # 日付だけの時は自分とフォローしているユーザのmemosを表示
    elsif search_date
      @memos = current_user.feed_memos.where(recorded_on: search_date).order('created_at DESC')
    #何も選択してない時は自分とフォローユーザの投稿全てを表示
    else
      @memos = current_user.feed_memos.order('created_at DESC')
    end
    @users_name = User.all.map { |user| user.profile.name }
    @users_name = @users_name.unshift(" ", "全員")
 end
end
