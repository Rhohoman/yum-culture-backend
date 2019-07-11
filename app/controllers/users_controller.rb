class UsersController < ApplicationController
    
    skip_before_action :authorized, only: [:create, :index, :update]
    
    def profile
        render json: { user: UserSerializer.new(session_user) }, status: :accepted
    end    

    def create
        # creating stuff
        # binding.pry
        @user = User.create(user_params)

        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end

    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def index
        @users = User.all
        render json: @users
    end

    def update
        # update stuff
        # binding.pry
        @user = User.find(params[:id])
        @user.update(update_params)

        render json: @user
    end

    # def update_location
    #     @user = User.find(params[:id])
    #     @user.update(location_params)

    #     render json: @user
    # end

    private

    def user_params
        params.permit(:name, :location, :username, :password, :user_picture)
    end

    def update_params
        params.require(:user).permit(:name, :username, :location)
    end

    # def username_params
    #     params.require(:user).permit(:username)
    # end

    # def location_params
    #     params.require(:user).permit(:location)
    # end
end
