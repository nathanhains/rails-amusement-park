class UsersController < ApplicationController
    before_action :require_login, only: [:show, :edit, :update, :destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect :new
        end
    end         

    def show
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :password, :tickets,:admin)
    end
end