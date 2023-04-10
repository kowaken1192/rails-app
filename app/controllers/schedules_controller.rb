class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  
  def index
  @schedules = Schedule.all
  end
  
  def show
  end
  
  def new
  @schedule = Schedule.new
  end
  
  def edit
  end
  
  def create
  @schedule = Schedule.new(schedule_params)
  if @schedule.save
  flash[:notice] = "スケジュールを新規登録しました"
  redirect_to schedules_path
  else
  render :new, status: :unprocessable_entity
  end
  end
  
  def update
  if @schedule.update(schedule_params)
  flash[:notice] = "スケジュールを更新しました"
  redirect_to schedules_path
  else
  render :edit, status: :unprocessable_entity
  end
  end
  
  def destroy
  @schedule.destroy
  respond_to do |format|
  format.html { redirect_to schedules_path, notice: "スケジュールを削除しました" }
  format.json { head :no_content }
  end
  end
  
  private
  def set_schedule
  @schedule = Schedule.find(params[:id])
  end
  
 
  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day,:memo)
  end
  end
  
  def sign_up_process
  schedule = Schedule.new(schedule_params)
  p schedule.title
  p schedule.valid?
  p schedule.errors.messages
  schedule.errors.messages.each do |key, messages|
  p key
  messages.each do |message|
  p message
  end
  end
  end
  
  
  
