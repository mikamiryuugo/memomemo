namespace :batch_tweet do
  desc "Autofill_tweet"
  task :memo => :environment do

  AutoTweetService.new.auto_tweet
    # @users = User.all
    # @tweets = ["も生き延びた", "の投稿です", "は寝てました。"]
    # @yesterday =  Date.yesterday.strftime("%Y年%m月%d日")
    
    # def yesterday_tweet_exist?(user)
    #   user.memos.exists?(recorded_on: Date.yesterday)
    # end
  
  
    # if @users
    #   @users.each do |user|
    #     user.memos.create(content: yesterday + @tweets.sample, recorded_on: Date.yesterday) if yesterday_tweet_exist?(user)
    #   end
    # end
    
  
  end
end