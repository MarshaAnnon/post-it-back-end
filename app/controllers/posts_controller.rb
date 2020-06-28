class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :update]
  
  def index
    @posts = Post.all
    render json: @posts.as_json(include: {comments: {only: [:id, :content, :name, :created_at]}})
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    render json: @post.as_json(include: {comments: {only: [:id, :content, :name, :created_at]}})
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post.as_json(include: {comments: {only: [:id, :content, :name, :created_at]}})
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end  

  def update
    if @post.update(post_params)
      render json: @post.as_json(include: {comments: {only: [:id, :content, :name, :created_at]}})
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    
  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :id, 
      :title, 
      :content, 
      :author_name, 
      :likes,
      :created_at, 
      :comments_attributes => [:id, :content, :name, :created_at, :post_id]
     )
  end
end
