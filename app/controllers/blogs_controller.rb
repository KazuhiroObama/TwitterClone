class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login, only: [:new, :show, :edit]

  def top

  end

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.create(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to new_blog_path, notice:"つぶやきを投稿しました！"
    else
      render "new"
    end
  end

  def show

  end

  def edit

  end

  def update

    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"つぶやきを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def login
    if !logged_in?
      redirect_to new_session_path
    end
  end

end
