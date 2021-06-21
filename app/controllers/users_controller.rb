class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :show, :likes, :followings, :followers]
  before_action :set_user, only: [:edit, :update, :show, :likes, :followings, :followers]
  before_action :move_to_index, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @posts = @user.posts.order('created_at DESC')
  end

  def likes
    likes = Like.where(user_id: @user).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  def search
    @users = User.search(params[:keyword])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :avatar)
  end

  def move_to_index
    redirect_to root_path unless @user.id == current_user.id
  end
end
