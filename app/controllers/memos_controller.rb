class MemosController < ApplicationController
  
  def create
    @memo = current_user.memos.build(memo_params)
    if @memo.save
      flash[:success] = "メモを投稿しました"
      redirect_to root_url
    else
      @memos = current_user.feed_memos.order('created_at DESC').page(params[:page])
      flash[:danger] = "メモの投稿に失敗しました"
      render 'toppages/index'
    end
  end

  def destroy
    @memo = current_user.memos.find_by(id: params[:id])
    @memo.destroy!
    flash[:success] = "メモを削除しました"
    redirect_to root_url
  end
  
  private
  
  def memo_params
    params.require(:memo).permit(:content, :recorded_on)
  end
  
  
end
