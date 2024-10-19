class StaticPagesController < ApplicationController
  before_action :require_user, only: :home
  def home
    @current_work = current_user.works.where(end_time: nil).last
    @work = Work.new
  end
end