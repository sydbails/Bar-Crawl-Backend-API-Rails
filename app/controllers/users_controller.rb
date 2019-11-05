class UsersController < ApplicationController
    def new
    end

    def index
        users = User.all
        render json: users, include: [:crawls], except: [:updated_at, :created_at]
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user, include: [:crawls], except: [:updated_at, :created_at]
    end

    def create
        @user = User.create(user_params)
        @token = encode_token(user_id: @user.id)
        render json: { user: @user, jwt: @token }, status: :created
    end

    def update
        user = User.find_by(id: params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :email, :password, :image, :birthdate, :zipcode)
    end
end
