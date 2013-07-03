class DoorAccessController < ApplicationController

	def validatedooraccess
		@fobs = Fob.all
		@doors = Door.all
    
#    fob = params[:fob][:fob_id]
#    door = params[:door][:door_id]
   
    if(params.has_key?(:fob) && params.has_key?(:door))
      adoor = Door.find(params[:door][:door_id])
      afob  = Fob.find(params[:fob][:fob_id])
      if adoor.validate_fob(afob) == true
        flash[:notice] = "Post successfully created"
        flash[:door_validate] = "Your doorname : #{adoor.doorname} your fob key: #{afob.key}"
      end
    end



  end

end
