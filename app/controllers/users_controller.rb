class UsersController < ApplicationController

    def new
     @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
        render :new
    end
  end 

    def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to '/welcome' if @user.organisation_id == nil
    end

   # def join
   #     organisation = Organisation.find(params[:id])
   #     if organisation
   #         User.update(current_user.id, organisation_id: organisation.id)
   #         redirect_to organisations_path
   #     end
   # end

  #  def leave
   #     User.update(current_user.id, organisation_id: nil)
  #      redirect_to organisations_path
  #  end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
