class PostsController < ApplicationController

  before_action :logged_in?
  before_action :user_owns_post?, only: [:edit, :update, :destroy]

  def user_owns_post?
    @current_user.id == self.author_id
  end

  def new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    if post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = self.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    post = Post.new(post_params)
    if post.update
      redirect_to post_url(params[:id])
    else
      flash.now[:errors] = self.errors.full_messages
      @post = Post.find(params[:id])
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render :destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end

end
