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
    @app_new = App.new
  end

  def create
    @apps = App.all
    @user = current_user
    @app_new = App.new(app_params)
    @app_new.user_id = current_user.id
    if @app_new.save
      flash[:nitice] = "投稿が完了しました"
      redirect_to app_path(@app_new.id)
    else
      render :index
    end
  end

  def edit
    @app = App.find(params[:id])
    if @app.user != current_user
      redirect_to apps_path
    end
  end

  def update
    @app = App.find(params[:id])
    if @app.update(app_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to app_path
    end
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
