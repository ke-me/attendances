class SessionsController < ApplicationController
  def new
  end

  def create
    # フォームに入力されたものから該当するユーザーを取得
    @user = User.find_by(name: params[:name], email: params[:email].downcase)
    # bcrypt の authenticateメソッドでパスワードの照合を行なう
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      # リダイレクト先後ほど変更
      # ↓あってる？
      redirect_to root_path
    else
      flash.now[:error] = "ログインに失敗しました"
      # 何これ↓
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
