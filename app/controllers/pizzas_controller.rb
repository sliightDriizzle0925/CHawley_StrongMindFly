class PizzasController < ApplicationController
  before_action :authenticate_user!
  #before_action :authenticate_chef
  before_action :get_toppings
  before_action :set_pizza, only: %i[ show edit update destroy ]
  def index
    @pizzas = Pizza.all
  end

  def show
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      redirect_to @pizza
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pizza.update(pizza_params)
      redirect_to @pizza
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @pizza.destroy
    redirect_to pizzas_path
  end

  private
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end
    def get_toppings
      @toppings = Topping.all
    end
    def pizza_params
      params.require(:pizza).permit(:name, toppings_list: [])
    end
    #def authorize_chef
      #redirect_to root_path, alert: "Access Denied"
    #end
end
