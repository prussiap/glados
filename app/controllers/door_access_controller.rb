class DoorAccessController < ApplicationController

	def validatedooraccess
		@fobs = Fob.all
		@doors = Door.all
		flash[:door_validate] = '''<b>testing door validate</b>'''
    
   



  end

end
