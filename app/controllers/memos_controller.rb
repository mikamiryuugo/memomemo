class MemosController < ApplicationController
  
  def create
    @memo = current_user.memos.build(memo_params)
    if @memo.save
      flash[:success] = "メモを投稿しました"
      redirect_to root_url
    else
      flash[:danger] = "メモの投稿に失敗しました"
      render 'toppages/index'
    end
  end

# メモの更新してないからココいらんやろ？
  # def update
  #   @memo = current_user.memos.find_by(id: params[:id])
  #   @memo.assign_attributes(memo_params) 
  #   if @memo.save
  #     flash[:success] = "メモを更新しました"
  #     redirect_to :edit
  #   else
  #     flash[:danger] = "メモの更新に失敗しました"
  #     render :edit
  #   end
  # end

  def destroy
    @memo = current_user.memos.find_by(id: params[:id])
    @memo.destroy!
    flash[:success] = "メモを削除しました"
    redirect_to root_url
  end
  
  private
  
  def memo_params
    params.require(:memo).permit(:content)
  end
  
  
end
