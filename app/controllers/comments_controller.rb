class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to topic_path(@comment.topic)
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@comment.topic), notice: 'コメントは削除されました。' }
      format.json { head :no_content }
      format.js { render :index, notice: 'コメントは削除されました。' }
    end
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
