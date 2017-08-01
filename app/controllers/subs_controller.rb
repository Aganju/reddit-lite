class SubsController < ApplicationController
  before_action :require_login
  before_action :sub_moderator?, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @subforum = Sub.find(params[:id])
    render :show
  end

  def edit
    @subforum = Sub.find(params[:id])
    render :edit
  end

  def update
    @subforum = Sub.find(params[:id])

    if @subforum.update(sub_params)
      redirect_to sub_url(@subforum)
    else
      flash.now[:errors] = @subforum.errors.full_messages
      render :edit
    end
  end

  def new
    @subforum = Sub.new
    render :new
  end

  def create
    @subforum = Sub.new(sub_params)
    @subforum.moderator = current_user
    if @subforum.save
      redirect_to sub_url(@subforum)
    else
      flash.now[:errors] = @subforum.errors.full_messages
      render :new
    end
  end

  def destroy
    subforum = Sub.find(params[:id])
    subforum.destroy
    redirect_to subs_url
  end

  def sub_moderator?
    subforum = Sub.find(params[:id])
    redirect_to sub_url(subforum) unless subforum.moderator == current_user
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
