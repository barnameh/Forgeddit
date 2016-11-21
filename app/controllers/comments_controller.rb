class CommentsController < ApplicationController
  def index
    if params[:link_id]
      @link = Link.find(params[:link_id])
      @comments = @link.comments
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @comments = @user.comments
    else
      @user = User.find(current_user_id)
      @comments = @user.comments
    end
  end

  def show
  end

  def new
    @comment = Comment.new(link_id: params[:link_id], user_id: current_user.id)
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to link_comments_path(params[:link_id])
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:link_id, :user_id, :text)
  end
end
