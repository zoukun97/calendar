class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to condition_path, notice: "Create today's condition!"
    else
      flash.now[:error] = 'failed'
      render :new
    end
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(condition_params)
      redirect_to condition_path, notice: "Edit today's condition!"
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