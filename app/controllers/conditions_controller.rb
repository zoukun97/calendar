class ConditionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @condition = current_user.conditions.build
  end

  def create
    @condition = current_user.conditions.build(condition_params)
    if @condition.save
      redirect_to condition_path(@condition.dates), notice: "Create today's condition!"
    else
      flash.now[:error] = 'failed'
      render :new
    end
  end

  def show
    @condition = current_user.conditions.find_by!(dates: params[:dates])
  end

  def edit
    @condition = current_user.conditions.find_by!(dates: params[:dates])
  end

  def update
    @condition = current_user.conditions.find_by!(dates: params[:dates])
    if @condition.update(condition_params)
      redirect_to condition_path(@condition.dates), notice: "Edit today's condition!"
    else
      flash.now[:error] = 'failed'
      render :edit
    end
  end

  private
    def condition_params
      params.require(:condition).permit(:dates, :mental, :temperature, :weight, :sleep_start, :sleep_end, :exercise, :food)
    end
end