class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  privete
    #ログイン済みのユーザーかどうかの確認
    def sign_in_user
      unless sign_in?
        flash[:danger] = "ログインしてください。"
        redirect_to signin_url
      end
    end
end
