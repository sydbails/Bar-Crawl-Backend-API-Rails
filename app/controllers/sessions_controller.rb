class SessionsController < ApplicationController
    wrap_parameters format: []

    def create 
        @user = User.find_by(email: login_params[:email])
        if @user && @user.authenticate(login_params[:password])
              token = encode_token({ user_id: @user.id })
              render json: { user: @user, jwt: token }, status: :accepted
        else
              render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end
      private 
    
      def login_params
        params.require(:user).permit(:email, :password, :session, :user)
      end
end

