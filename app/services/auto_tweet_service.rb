class AutoTweetService
   
  def initialize
    @users = User.all
    @tweets = ["も生き延びた", "の投稿です", "は寝てました。"]
    @tweet_yesterday = Date.yesterday.strftime("%Y年%m月%d日")
    @yesterday = Date.yesterday
  end

  def auto_tweet
      @users.each do |user|
        user.memos.create(content: @tweet_yesterday + @tweets.sample, recorded_on: Date.yesterday) unless yesterday_tweet_exists?(user, @yesterday)
      end
  end
    
  def yesterday_tweet_exists?(user, date)
    user.memos.exists?(recorded_on: date)
  end

end