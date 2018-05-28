class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def top
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'top'
    end
  end

  def show

  end

  def index
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
    @favorites_blogs = @user.favorites_blogs
  end

end
