class WorksController < ApplicationController
  before_action :require_user
  def index
    # @works = Work.where(user_id: current_user.id)
    # @works = current_user.works.order(start_time: :asc)
    
    @month = params[:month] ? Date.parse(params[:month]) : Time.current.beginning_of_month
        # date = Date.parse(params[:month])
      @works = current_user.works.where(start_time: @month..@month.end_of_month)
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

  def edit
    # ↓下記３つとも同じ意味っぽい
    # @work = current_user.works.find_by(id: params[:id])
    # @work = Work.find(user_id: current_user.id)
    @work = Work.find(params[:id])
  end

  def update
    if params[:commit] == "退勤"
      @work = current_user.works.find_by(id: params[:id], end_time: nil)
      if @work.update(end_time: Time.zone.now)
        flash[:success] = "退勤しました"
        redirect_to root_path
      else
        flash.now[:danger] = "退勤に失敗しました"
        redirect_to root_path
      end
    elsif params[:commit] == "更新"
      @work = Work.find(params[:id])
      if @work.update(work_params)
        flash[:success] = "勤怠データの更新が完了しました"
        redirect_to works_path
      else
        flash[:errors] = @work.errors.full_messages
        redirect_to action: :edit
      end
    end
  end

  def destroy
    # @work = current_user.works.find_by(id: params[:id])
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
  end


  private

  def work_params
    params.require(:work).permit(:start_time, :end_time)
  end
end
