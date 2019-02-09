class SearchesController < ApplicationController
    
 def index
    search_name = params[:name] unless params[:name] == " " || params[:name] == "全員"
    search_date = params[:date]
    # 名前と日付がある時
    if search_name && search_date
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos.where(recorded_on: search_date.to_date)
    # 名前だけの時
    elsif search_name
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos
    # 日付だけの時（空白、全員が含まれる）
    elsif search_date
      @memos = current_user.feed_memos.where(recorded_on: search_date.to_date).order('created_at DESC')
    #何も選択してない時は自分とフォローユーザの投稿全てを表示
    else
      @memos = current_user.feed_memos.order('created_at DESC')
    end
    # @users_id = User.all.map {|user| user.id}
    @users_name = User.all.map { |user| user.profile.name }
    @users_name = @users_name.unshift(" ", "全員")
 end
end
