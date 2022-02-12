class ConditionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @condition = current_user.conditions.build
  end

  def create
    @condition = current_user.conditions.build(condition_params)
    if @condition.save
      redirect_to condition_path(@condition.dates), notice: "Create today's condition!"
      level_up
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
    @user_level = current_user.level
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

    def level_up
      point = current_user.point
      new_point = point + 1
      current_user.update!(point: new_point)
      level = Level.find_by!(level: current_user.level + 1)
      if new_point == level.thresold
        current_user.update!(level: level.level)
      end
    end
end