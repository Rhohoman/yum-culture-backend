class PostsController < ApplicationController

    skip_before_action :authorized, only: [:create, :index, :show]

    def create
        @post = Post.create(post_params)
        render json: @post
    end

    def index
        @posts = Post.all
        render json: @posts
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    private

    def post_params
        params.permit(:user_id, :food_id, :username, :image_url, :text, :likes, :dislikes)
    end

end
