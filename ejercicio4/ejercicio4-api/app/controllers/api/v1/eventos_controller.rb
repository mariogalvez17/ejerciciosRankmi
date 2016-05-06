module Api
	module V1
		class EventosController < ApplicationController			

			def index
				eventos = Evento.all
				render json: eventos, status:200				
			end
			

			def show
				logger.info "#{__method__}"
				id       = params[:id]
				evento= Evento.find(id)
				render json: evento,status: 200
			end

			def create
				evento = Evento.new
				evento.nombre=params[:nombre]
				evento.params = params[:options]
				evento.cliente_id= Cliente.find_by(ip: params[:padre]).id
				evento.hora=params[:hora]
				if !evento.save
					return
				else
					logger.info 'success'
					render json: evento,status:200
				end
			end			
		end
	end
end	
