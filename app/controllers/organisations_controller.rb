class OrganisationsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
       @organisations = Organisation.all
    end

    def new
     @organisation = Organisation.new
    end

    def create
        @organisation = Organisation.create(organisation_params)
        if @organisation.save
            User.update(current_user.id, organisation_id: @organisation.id)
            redirect_to organisations_path
        else
            redirect_to '/edit'
        end
    end

    def edit
        @organisation = Organisation.find(params[:id])
    end

    def update
        @organisation = Organisation.update(params[:id], organisation_params)
        if @organisation.errors.any?
            render "edit"
        else
            if current_user.organisation_id != nil
                redirect_to organisations_path
            else
                redirect_to '/edit'
            end
        end
    end

    def destroy
        Organisation.destroy(params[:id])
        redirect_to organisations_path
    end


    private 

    def organisation_params
        params.require(:organisation).permit(:name, :rate)
    end
end