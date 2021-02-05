class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録後
  def after_sign_up_path_for(resource)
    if member_signed_in?
      member_path(current_member)
    else
      admins_shops_path
    end
  end

  # ログイン後
  def after_sign_in_path_for(resource)
    if member_signed_in?
      member_path(current_member)
    else
      admin_shops_path
    end
  end

  # ログアウト後
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
