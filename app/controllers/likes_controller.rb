class LikesController < ApplicationController
  def create
    user = current_user
    post  = Post.find params[:post_id]

    user.liked.push post
    redirect_to post
  end
  def destroy
    user = current_user
    post  = Post.find params[:post_id]

    user.liked.delete post
    post.save
    user.save
    #  remove current user from post.likes
    redirect_to post

  end
end
