module Api
	module V1
		class ClientesController < ApplicationController
			  before_action :set_cliente, :create 
			def index
				clientes = Cliente.all
				render json: clientes				
			end
			

			def show
				logger.info "#{__method__}"
				id       = params[:id]
				cliente= Cliente.find(id)
				render json: cliente
			end

			def create
				if !@cliente 
					cliente = Cliente.new
					cliente.ip = params[:clientIP]
					cliente.browser = params[:clientBrowser]
					cliente.system =  params[:clientSO]
					cliente.application_id =Application.find_by(token: params[:clientToken]).id
					if !cliente.save					
						render json: { "message" => "No se salvo el registro de cliente"}, status: :unprocessable_entity #500
					else
						logger.info 'successfully registered'
						render json: cliente, status:200
					end
				else
					logger.info 'success, already registered'
					render json: cliente, status:200
				end
			end

			def set_cliente
				logger.info '********************'
				logger.info"********#{request.headers}*********************"
				@cliente= Cliente.find_by(ip: params[:clientIP])
			end
		end
	end
end			