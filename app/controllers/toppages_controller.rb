class ToppagesController < ApplicationController
  def index
    @memo = current_user.memos.build
    @memos = current_user.feed_memos.order('created_at DESC')
  end
end
