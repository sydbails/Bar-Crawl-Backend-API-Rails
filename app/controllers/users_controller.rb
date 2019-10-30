class UsersController < ApplicationController
    def new
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user, include: [:crawls], except: [:updated_at, :created_at]
    end

    def create
        user = User.create(user_params)
        render json: {status: 'User successfully created'}
    end

    def update
        user = User.find_by(id: params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :email, :password)
    end
end
