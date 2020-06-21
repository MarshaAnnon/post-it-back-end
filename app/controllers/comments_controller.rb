class CommentsController < ApplicationController

  #before_action :set_comment, only: [:show, :update, :destroy]

  def index
    comments = Comment.all
    options = {
      include: [:post]
    }
    render json: CommentSerializer.new(comments, options)
  end

  def show
    comment = Comment.find_by_id(params[:id])
    options = {
      include: [:post]
    }
    render json: CommentSerializer.new(comment, options)  
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      options = {
        include: [:post]
      }
      render json: CommentSerializer.new(comment, options)#, status: :created, location: comment
    else
      render json: comment.errors#, status: :unprocessable_entity
    end
  end

  private

  #def set_comment
  #  comment = Comment.find_by_id(params[:id])
  #end

  def comment_params
    params.require(:comment).permit(:content, :name, :post_id)
  end

end
