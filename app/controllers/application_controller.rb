class ApplicationController < ActionController::Base
# top, about の2つのアクションのみ、ログイン無しでもアクセス可能にする
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

# ログインした直後は、ユーザーの詳細ページに遷移
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end


  protected

#configure_permitted_parametersというメソッドを記述する。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
