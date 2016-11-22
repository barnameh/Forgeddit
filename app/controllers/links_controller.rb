class LinksController < ApplicationController
  def index
    @links = Link.all.order(created_at: :desc)
  end

  def new
    @link = Link.new(user_id: current_user.id)
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to links_path
    else
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
