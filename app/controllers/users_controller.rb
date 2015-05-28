class UsersController < ApplicationController

    before_action :require_user, :only => [:show, :edit, :update, :destroy]

    def require_user
        if session[:user_id].blank?
            redirect_to sessions_login_url, notice: "You must be logged in to do that."
        end

        @user = User.find_by(id: session[:user_id])
    end

    def show
    end

    def new
    end

    def create
        user = User.new
        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.email = params[:email]
        user.password = params[:password]
        user.save
        session[:user_id] = user.id
        redirect_to groups_index_url
    end

    def edit
    end

    def update
    end

    def destroy
    end

end
