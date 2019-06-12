class FoodsController < ApplicationController

    skip_before_action :authorized
    
    def index
        @foods = Food.all
        render json: @foods
    end

    def show
        @food = Food.find(params[:id])
        render json: @food
    end

end
