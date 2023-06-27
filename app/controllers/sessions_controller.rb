class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            sessions[:user_id] = user.id
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path notice: "Logged out"
    end
end