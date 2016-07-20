class PlacasController < ApplicationController
	def new 
		@placa = Placa.new
		@placas = Placa.all
	end

	def create
		@placa = Placa.new(placa_params)
		Time.zone = 'America/Lima'
		t = Time.now
		dia = @placa.date.strftime('%A')
		digito =  @placa.plate_number[-1,1]
		monday = [1,2]
		tuesday =  [3,4]
		wednesday = [5,6]
		thursday = [7,8]
		friday = [9,0]
		if dia =='Monday'
			
			if @placa.road =  monday.include?(digito.to_i) 
			@placa.road = "no circula"
			else 
			 @placa.road = "circula"
			end  
		 	
		elsif dia =='Tuesday'
			
			if @placa.road =  tuesday.include?(digito.to_i) 
			@placa.road = "no circula"
			else 
			 @placa.road = "circula"
			end  
		 	
		elsif dia =='Wednesday'
			
			if @placa.road =  wednesday.include?(digito.to_i) 
			@placa.road = "no circula"
			else 
			 @placa.road = "circula"
			end  
		 
		elsif dia =='Thursday'
			
			if @placa.road =  thursday.include?(digito.to_i) 
			@placa.road = "no circula"
			else 
			 @placa.road = "circula"
			end  
		 		
		elsif dia =='Friday'
			
			if @placa.road =  friday.include?(digito.to_i) 
			@placa.road = "no circula"
			else 
			 @placa.road = "circula"
			end  
		 	
	else 
	@placa.road =  "sin restriccion fin de semana "
           end
		
		@placa.time = t
		if @placa.save
			redirect_to new_placas_path
		end
	end

	def placa_params
		
		params.require(:placa).permit(:plate_number,:date)

	end




end
