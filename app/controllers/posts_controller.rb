class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def index
    posts = Post.all

    render json: posts
  end

  def show
    render json: post
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post#, status: :created, location: post
    else
      render json: post.errors#, status: :unprocessable_entity
    end
  end

  def update
    if post.update(post_params)
      render json: post
    else
      render json: post.errors#, status: :unprocessable_entity
    end
  end


  private
    
    def set_post
      post = Post.find_by_id(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :author_name, :likes)
    end
end
