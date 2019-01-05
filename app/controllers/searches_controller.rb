class SearchesController < ApplicationController
    
 def index
    search_name = params[:name]
    search_date = params[:date]
    if search_name && search_date
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos.where(recorded_on: search_date.to_date)
      # @memos = search_user.memos
    elsif search_name
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos
    elsif search_date
      @memos = current_user.feed_memos.where(recorded_on: search_date.to_date).order('created_at DESC')
    else
      @memos = current_user.feed_memos.order('created_at DESC')
    end
    
    @users_name = User.all.map { |user| user.profile.name }
    
    #上の@users_nameの中に、ハッシュの配列を入れるのかな？そうすれば表示名と値をわけられる。
    #そしたら検索部分もuser_id: になるのかな
    # @users_id =  User.all.map {|user| user.id}
 end
end
