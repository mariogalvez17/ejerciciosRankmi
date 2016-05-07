module Api
	module V1
		class ApplicationsController < ApplicationController

			before_action :identity

			def index
				applications = Application.all
				render json: applications, status: :ok	
			end
			
			def show
				logger.info "#{__method__}"
				id       = params[:id]
				application= Application.find(id)
				render json: application
			end

			def create

			end

			def identity	
			 	if Application.find_by(token: request.headers['X-Auth-Token'])
			 		render json: { "message" => "application validated"}, status: :ok
			 	else
			 		render json: { "message" => "can't validate app"}, status: :unprocessable_entity #401
			 	end
			end

		end
	end
end			