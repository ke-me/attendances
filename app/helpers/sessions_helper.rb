module SessionsHelper
  def log_in(user)
    # ログイン時にセッションIDを付与
    session[:user_id] = user.id
  end

  def current_user
    # @current_userがnillか未定義の場合、右辺の値を代入（無駄なDBへのアクセスを避ける）
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # ログインしているかチェック
    !current_user.nil?
  end

  def require_user
    if !logged_in?
      flash[:alert] = "ログインしてください"
      redirect_to login_path
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
