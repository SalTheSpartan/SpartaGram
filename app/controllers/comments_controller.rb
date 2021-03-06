class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create

    comment = Comment.new(comment_params)
    user = current_user
    post = Post.find params[:post_id]
    comment.post = post
    comment.user = user
    if comment.save
      redirect_to post
      else
        render 'new'
    end

  end


  private
    def comment_params
      params.require(:comment).permit(:content)

    end
end
