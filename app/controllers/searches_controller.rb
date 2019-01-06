class SearchesController < ApplicationController
    
 def index
    search_name = params[:name] unless params[:name] == " " || params[:name] == "全員"
    search_date = params[:date]
    if search_name && search_date
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos.where(recorded_on: search_date.to_date)
    elsif search_name
      search_user = User.joins(:profile).find_by(profiles: {name: search_name})
      @memos = search_user.memos
    elsif search_date
      @memos = current_user.feed_memos.where(recorded_on: search_date.to_date).order('created_at DESC')
    else
      @memos = current_user.feed_memos.order('created_at DESC')
    end
    # @users_id = User.all.map {|user| user.id}
    @users_name = User.all.map { |user| user.profile.name }
    @users_name = @users_name.unshift(" ", "全員")
 end
end
