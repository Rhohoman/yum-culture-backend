class PostsController < ApplicationController

    skip_before_action :authorized, only: [:create, :index, :show, :update]

    def create
        # binding.pry
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

    def update
        # binding.pry
        @post = Post.find(params[:id])
        @post.update(post_update_params)
        render json: @users
    end

    private

    def post_params
        params.permit(:user_id, :food_id, :foodName, :username, :image_url, :profile_image_url, :text, :likes, :dislikes)
    end

    def post_update_params
        params.require(:post).permit(:likes)
    end

end
