class DoorAccessController < ApplicationController

	def validatedooraccess
		@fobs = Fob.all
		@doors = Door.all
	end

end
