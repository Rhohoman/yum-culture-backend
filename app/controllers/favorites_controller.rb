class FavoritesController < ApplicationController

    skip_before_action :authorized, only: [:create, :show]

    def create
        @favorite = Favorite.create(favorite_params)
        render json: @user
    end

    def show
        @favorite = Favorite.find(params[:id])
        render json: @favorite
    end

    private

    def favorite_params
        params.permit(:user_id,:food_id,:name,:image,:categories,:youtube_url,:area,:instructions)
    end
end
