class FoodsController < ApplicationController

    def create

    end 

    def index
        foods = Food.all
        render json: foods
    end
end
