class UsersController < ApplicationController
    
    skip_before_action :authorized, only: [:create, :show]
    
    def profile
        render json: { user: UserSerializer.new(session_user) }, status: :accepted
    end    

    def create
        # creating stuff
        # byebug
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

    def update_username
        # update stuff
        @user = User.find(params[:id])
        @user.update(username_params)

        render json: @user
    end

    def update_location
        @user = User.find(params[:id])
        @user.update(location_params)

        render json: @user
    end

    private

    def user_params
        params.permit(:name, :location, :username, :password)
    end

    def username_params
        params.require(:user).permit(:username)
    end

    def location_params
        params.require(:user).permit(:location)
    end
end
