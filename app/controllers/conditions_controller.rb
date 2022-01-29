class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to root_path, notice: "Create today's condition!"
    else
      flash.now[:error] = 'failed'
      render :new
    end
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def edit

  end

  def update
  end

  private
    def condition_params
        params.require(:condition).permit(:dates, :mental, :temperature, :weight, :sleep_start, :sleep_end, :exercise, :food)
    end
end