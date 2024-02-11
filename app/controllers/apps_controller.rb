class AppsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @app_new = App.new
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
    @user = @app.user
    @app_new = App.new(profile_image: "default-image.jpg")
  end

  def create
    @apps = App.all
    @user = current_user
    @app_new = App.new(app_params)
    @app_new.user_id = current_user.id
    if @book_new.save
      flash[:nitice] = "投稿が完了しました"
      redirect_to app_path(current_user)
    else
      render :index
    end
  end

  def edit
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(current_user)
  end

  def destroy
    App.find_by(id: params[:id]).destroy
    redirect_to apps_path
  end

  private

  def app_params
    params.require(:app).permit(:title, :body, :app_image)
  end

end
