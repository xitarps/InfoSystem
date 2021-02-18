class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: %i[index show update]
  def index
    @comments = Comment.where(allowed: false)
  end

  def new
    @comment = Comment.new
  end

  def create
    fetch_object
    @comment = @object.comments.new(description: comment_params[:description])
    @comment.user = current_user
    @comment.language = locale.to_s

    redirect_to @comment.reference if @comment.save
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.allowed = true
    redirect_to @comment.reference if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    redirect_to comments_path if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :object_type, :object_id)
  end

  def fetch_object
    @object = if params[:comment][:object_type] == 'Video'
                Video.find(params[:comment][:object_id])
              elsif params[:comment][:object_type] == 'Article'
                Article.find(params[:comment][:object_id])
              end
  end
end
