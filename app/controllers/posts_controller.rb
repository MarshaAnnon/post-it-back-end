class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :update]

  def index
    posts = Post.all
    options = {
      include: [:comments]
    }
    render json: PostSerializer.new(posts, options)
  end

  def show
    post = Post.find_by_id(params[:id])
    options = {
      include: [:comments]
    }
    render json: PostSerializer.new(post, options)
  end

  def create
    post = Post.new(post_params)
    if post.save
      options = {
        include: [:comments]
      }
      render json: PostSerializer.new(post, options)#, status: :created, location: post
    else
      render json: post.errors#, status: :unprocessable_entity
    end
  end  

  def update
    if post.update(post_params)
      options = {
        include: [:comments]
      }
      render json: PostSerializer.new(post, options)#, status: :created, location: post
    else
      render json: post.errors#, status: :unprocessable_entity
    end
  end

  private
    
  #def set_post
    #post = Post.find_by_id(params[:id])
  #end

  def post_params
    params.require(:post).permit(:title, :content, :author_name,:likes)
  end
end
