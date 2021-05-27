class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :latest]
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @posts = Post.limit(6).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def latest
    @posts = Post.includes(:user).order('created_at DESC')
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :image, :time_slot_id, :category_id, :situation_id, :prefecture_id, :weather_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @post.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
