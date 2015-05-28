class SessionsController < ApplicationController

    def new
        if session[:user_id]
            redirect_to groups_index_url
        end
    end

    def create
        user = User.find_by(email: params[:email])
        if user
            if user.authenticate(params[:password])
                session["user_id"] = user.id
                redirect_to groups_index_url
                return
            end
        end
        redirect_to sessions_new_url, notice: "Unknown email/password."
    end

    def destroy
        session.delete 'user_id'
        redirect_to sessions_new_url
    end

end
