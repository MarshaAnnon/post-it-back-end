class CommentsController < ApplicationController

  def show
    @comment = Comment.find_by_id(params[:id])
    options = {
      include: [:post]
    }
    render json: @comment.as_json(include: {post: {only: [:id, :title, :content:author_name, :likes, :created_at]}})  
  end
      
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment.as_json(include: {post: {only: [:id, :title, :content:author_name, :likes, :created_at]}})
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
    
  private
    
  def comment_params
    params.require(:comment).permit(:id, :content, :name, :post_id)
  end
      
end
