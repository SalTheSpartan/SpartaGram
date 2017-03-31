class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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

    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = "BdpIfMqCo4gkk57KsrXdeyeMl"
      config.consumer_secret = "hv5x5XU8JxAOHEmmvwkPOEBFBMMVxD2Spil4QsJ30Wt6Wr7c3W"
      config.access_token    = "847059707995045888-rB0OXKOFAcRoaaq0BOCflB67D6sKm2I"
      config.access_token_secret = "XZRN2fsVrVEX6r2YPsK3KcIDSaIglApg75ZNYIvwa9AOe"
    end
# Twitter
    # url = "https://s3.eu-west-2.amazonaws.com/spartagram/#{post.image.file.path}"
    # client.update(url)
    # client.update_with_media(post.caption, File.new(url))
    client.update_with_media(post.caption, File.new(post.image.path))
    # binding.pry
    # "https://s3.eu-west-2.amazonaws.com/spartagram/uploads/post/image/ #{post.id} /"


    uploader = InstagramUploader::Uploader.new('07712677611', 'sparta')
    uploader.upload(post.image.path, post.caption)
    post.caption.gsub(/[\'\n]/, '  ').gsub(/[^[:print:]]/) {|x| x.ord}
    redirect_to show, notice: "Succesfully Uploaded to Instagram"
  end

  def new #display the new posts
    @post = Post.new


    #add template
  end

  def create #save new posts
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
