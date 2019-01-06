class ApplicationController < ActionController::Base

  # deviseでログインしたときに遷移する画面
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  # deviseでログアウトした時に遷移する画面
  def after_sign_out_path_for(resource)
    root_path
  end

  # deviseでユーザー情報をアップデートした後に遷移する画面
  # def after_update_path_for(resource)
    # user_path(current_user)
  # end

  # ログイン情報にusernameを使うための設定
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :username, :email, :image, :introduction, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
