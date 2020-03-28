class CommentsController < ApplicationController

  def create
    # p comment_params
    # @comment = Post.find(4).comments.create(comment_params)
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = 1
    @comment.post_id = 4
    @comment.save
    redirect_to post_path(4)
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.find(10)
    @comment.destroy
    redirect_to post_path
  end

  private
  def comment_params
    params.permit(:content,:post_id)
  end

end
