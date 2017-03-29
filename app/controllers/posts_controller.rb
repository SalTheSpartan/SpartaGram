class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show #show lists of all posts
    @comments = Comment.where(post_id: @post)
    @post = Post.find(params[:id])

    #add template

  end
  def upload_insta
    # imagePath = 'public' + params[:postImageUrl]
    # imageCaption = params[:postImageCaption]

    post = Post.find(params[:id])

    puts post.image.path

    uploader = InstagramUploader::Uploader.new('07712677611', 'sparta')
    uploader.upload(post.image.path, post.caption)
    post.caption.gsub(/[\'\n]/, '  ').gsub(/[^[:print:]]/) {|x| x.ord}

    redirect_to show, notice: "Succesfully Uploaded to Instagram"
  end

  def new #display the new posts
    @post = Post.new
    # puts current_user.

    #add template
  end

  def create #save new posts
    @post = Post.new(post_params)

    #will save and rediret
    if @post.save
      redirect_to @post, notice: "Succesfully created a new Post"
    else
      binding.pry
      render "new"
    end

  end

  def edit #display form to edit posts

  end

  def update #save changes
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "Succesfully updated"
    else
      render "edit"
    end

    #will save and redirect
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit(:title, :caption, :image)
  end
end
