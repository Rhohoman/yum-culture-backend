class FavoritesController < ApplicationController

    skip_before_action :authorized, only: [:create, :show, :index, :largest_hash_key, :destroy]

    def create
        # binding.pry
        @favorite = Favorite.create(favorite_params)
        render json: @favorite
    end

    def show
        @favorite = Favorite.find(params[:id])
        render json: @favorite
    end

    def index
        @favorites = Favorite.all
        render json: @favorites
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        # binding.pry
        @favorite.destroy
        render json: @favorite
    end

    def largest_hash_key
        # binding.pry
        largest_value = Favorite.largest_hash_key
        render json: largest_value
    end
    

    private

    def favorite_params
        params.permit(:user_id,:food_id,:name,:image,:categories,:youtube_url,:area,:instructions)
    end
end
