class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # ユーザーがログインしていなければログイン画面に遷移させる
  before_action :configure_permitted_parameters, if: :devise_controller?
  # もしdeviseに関するコントローラーの処理であればメソッドを呼び出すことができる
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

# before_action,con掘り下げる
# ストロングパラメーターの設定
# nameカラムの保存ができるようになる