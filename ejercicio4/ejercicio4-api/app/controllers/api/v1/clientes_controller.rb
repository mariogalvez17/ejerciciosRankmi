module Api
	module V1
		class ClientesController < ApplicationController

			def index
				@clientes = Cliente.all
				render json: @clientes				
			end
			

			def show
				logger.info "#{__method__}"
				id       = params[:id]
				@cliente= Cliente.find(id)
				render json: @cliente
			end

			def create

			end
		end
	end
end			