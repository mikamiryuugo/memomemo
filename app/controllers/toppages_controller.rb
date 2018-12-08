class ToppagesController < ApplicationController
  def index
    @memo = current_user.memos.build
    @memos = current_user.memos.order('created_at DESC')
  end
end
