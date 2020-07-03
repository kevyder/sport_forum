class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.user_id

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
