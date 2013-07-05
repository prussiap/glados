class DoorAccessController < ApplicationController

	def validatedooraccess
		@fobs = Fob.all
		@doors = Door.all

    if(params.has_key?(:fob) && params.has_key?(:door))
      adoor = Door.find(params[:door][:door_id])
      afob  = Fob.find(params[:fob][:fob_id])
      if adoor.validate_fob(afob) == true
        flash.now[:success] = "Post successfully created"
      else
        flash.now[:error] = "You are not authorized to access this door. Come again!"
      end
    end
  end
end
