class UsersController < ApplicationController
  # 共通のパーツを定義（関数？は下部に記述）
  before_action :set_user,only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "登録が完了しました"
      log_in @user
      redirect_to @user
    else
      # render :newだと動かない
      flash[:errors] = @user.errors.full_messages
      redirect_to action: :new
    end
  end

  # def complete
  #   # 完了画面の処理（特に何もしなくてよい）
  # end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報の更新が完了しました"
      redirect_to @user
    else
      # render :edit
      flash[:errors] = @user.errors.full_messages
      redirect_to action: :edit
    end
  end

  # ↓うまくいかないので放置
  def destroy
    @user.destroy
    # ↓後ほどリダイレクト先変更する
    redirect_to signup_path
  end

  # ここ以降の関数は、users_controllerでしか呼び出せないメソッド
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # 共通のパーツをまとめる
  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "許可されていない操作です。プロフィールの編集、削除は作成者ご自身のみ可能です。"
      redirect_to @user
    end
  end
end
