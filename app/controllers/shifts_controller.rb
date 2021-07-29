class ShiftsController < ApplicationController


    private

    def shift_params
        params.require(:shift).permit(:date, :start, :finish, :break)
    end

end
