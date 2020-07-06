class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def index
        @users = User.all
        render json: @users
    end
   
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'Failed to create user' }, status: :not_acceptable
      end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end
   
    private
   
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
