class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show #show lists of all posts
    @post = Post.find(params[:id])

    #add template
  end

  def new #display the new posts
    @post = Post.new

    #add template
  end

  def create #save new posts
    @post = Post.new(post_params)
    @post.save
    #will save and rediret
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

  end

  def edit #display form to edit posts

    # add template
  end

  def update #save changes

    #will save and redirect
  end

  def destroy

  end

  private

  def find_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit(:title, :caption)
  end
end
