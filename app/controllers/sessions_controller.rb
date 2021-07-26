class SessionsController < ApplicationController

    def welcome
      if current_user.organisation_id == nil
        @organisation = Organisation.new
    else
        redirect_to organisations_path
    end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
    
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "Sorry, your username or password was incorrect"
          redirect_to '/login'
        end
      end

      def organisations
        if current_user.organisation_id != nil
            @organisation = Organisation.find(current_user.organisation_id)
        else
            redirect_to welcome_path
        end
    end
 
end
