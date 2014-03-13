# class SessionsController < ApplicationController

#   def callback
#     auth = request.env["omniauth.auth"]
#     user = User.where( provider: auth["provider"], uid: auth["uid"] ).first || User.create_with_omniauth( auth )
#     session[:user_id] = user.id

#     # 保管URLへリダイレクト
#     unless session[:request_url].blank?
#       redirect_to session[:request_url]
#       session[:request_url] = nil
#       return
#     end

# #    redirect_to :root, notice: "ログインしました。"
#     redirect_to( { controller: "my", action: "library" }, notice: "ログインしました。" )
#   end

#   def destroy
#     session[:user_id] = nil

#     redirect_to :root, notice: "ログアウトしました。"
#   end

#   def failure
#     render text: "<span style='color: red;'>Auth Failure</span>"
#   end
# end

class SessionsController < ApplicationController
  skip_before_filter :authenticate

  # ログイン
  def callback
    # auth = request.env["omniauth.auth"]
    # authentication = Authentication.find_by(provider: auth["provider"], uid: auth["uid"]) || Authentication.create_with_omniauth(auth)
    # authentication.auth_update(auth)

    # # ユーザ取得or作成
    # user = User.find_by(id: authentication.user_id) || User.create_with_auth(authentication)

    auth = request.env["omniauth.auth"]
    user = User.where( provider: auth["provider"], uid: auth["uid"] ).first || User.create_with_omniauth( auth )
    user.auth_update(auth)
    session[:user_id] = user.id

    session[:user_id] = user.id

    # 保管URLへリダイレクト
    unless session[:request_url].blank?
      redirect_to session[:request_url]
      session[:request_url] = nil
      return
    end

    redirect_to :root and return
  end

  # ログアウト
  def destroy
    session[:user_id] = nil

    redirect_to :root and return
  end

  # ログインエラー
  def failure
    flash[:alert] = 'Auth Failure'
    redirect_to :root and return
  end
end
