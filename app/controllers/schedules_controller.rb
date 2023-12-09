class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.nil?
      flash[:error] = "スケジュールが見つかりませんでした"
      redirect_to schedules_path
    end
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to schedules_path
    else
      render :edit
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      flash[:notice] = "スケジュールを削除しました"
    end
    redirect_to schedules_path
  end
end
  


  