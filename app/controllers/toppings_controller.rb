class ToppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topping, only: %i[ show edit update destroy ]
  def index
    @toppings = Topping.all
  end

  def show
  end

  def new
    @topping = Topping.new
  end

  def create
    @topping = Topping.new(topping_params)
    if @topping.save
      redirect_to @topping
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @topping.update(topping_params)
      redirect_to @topping
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @topping.destroy
    redirect_to toppings_path
  end

  private
    def set_topping
      @topping = Topping.find(params[:id])
    end
    def topping_params
      params.expect(topping: [ :name ])
    end
end
