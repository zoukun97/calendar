class ConditionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @condition = current_user.conditions.build
  end

  def create
    @condition = current_user.conditions.build(condition_params)
    if @condition.save
      redirect_to condition_path(@condition.dates), notice: "Create today's condition!"
      if three_days
        level = current_user.level += 1
        current_user.update(level: level)
      end
    else
      flash.now[:error] = 'failed'
      render :new
    end
  end

  def show
    @condition = current_user.conditions.find_by!(dates: params[:dates])
    @conditions = current_user.conditions.order(dates: :desc)
  end

  def index
    @conditions = current_user.conditions.order(dates: :desc)
    @user = current_user.level
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

    def three_days
      today = Date.today
      current_user.conditions.exists?(dates: today) && current_user.conditions.exists?(dates: today - 1) && current_user.conditions.exists?(dates: today - 2)
    end
end