class ApplicationController < ActionController::Base
  protect_from_forgery

  # httpsリダイレクト
  # before_filter :ssl_redirect if Rails.env.production? or Rails.env.staging?

  # 未ログインリダイレクト
  before_filter :authorize

  # セッション有効期限延長
  before_filter :reset_session_expires

  private

  # # httpsへリダイレクト(Production環境のみ)
  # def ssl_redirect
  #   unless request.env["HTTP_X_FORWARDED_PROTO"].to_s == "https"
  #     request.env["HTTP_X_FORWARDED_PROTO"] = "https"

  #     redirect_to request.url and return
  #   end
  # end

  # ログイン認証
  def authorize
    # セッション／トップコントローラ以外で
    if params[:controller] != "sessions" and params[:controller] != "top"
      # 未ログインであればルートヘリダイレクト
      if session[:user_id].blank?
        # リクエストURL保管
        session[:request_url] = request.url

        redirect_to :root and return
      end
    end
  end

  # セッション期限延長
  def reset_session_expires
    request.session_options[:expire_after] = 2.weeks
  end

  def current_user
    @current_user ||= User.where( id: session[:user_id] ).first
  end
  helper_method :current_user

  # # Markdown変換
  # def show_markdown( text )
  #   begin
  #     html_render = HtmlWithPygments.new( hard_wrap: true, filter_html: false )
  #     markdown    = Redcarpet::Markdown.new( html_render, autolink: true, fenced_code_blocks: true, space_after_headers: true )

  #     return markdown.render( text )
  #   rescue => e
  #     return e.message
  #   end
  # end
  # helper_method :show_markdown
end
