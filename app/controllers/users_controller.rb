class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @app_new = App.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @app_new = App.new
    @apps = @user.apps
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'profileが新しく保存されました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
