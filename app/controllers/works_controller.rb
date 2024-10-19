class WorksController < ApplicationController
  before_action :require_user
  def index
    @works = Work.where(user_id: current_user.id)
  end

  def create
    @work = current_user.works.build(start_time: Time.zone.now)
    if @work.save
      flash[:success] = "業務開始"
      # あとで見直す↓
      redirect_to root_path
    else
      flash[:danger] = "出勤に失敗しました"
      # あとで見直す↓
      redirect_to root_path
    end
  end

  # いる？
  # def edit
  #   @work = Work.find(user_id: current_user.id)
  # end

  def update
    @work = current_user.works.find_by(id: params[:id], end_time: nil)
    if @work.update(end_time: Time.zone.now)
      flash[:success] = "退勤しました"
      redirect_to root_path
    else
      flash.now[:danger] = "退勤に失敗しました"
      redirect_to root_path
    end

  end
end
