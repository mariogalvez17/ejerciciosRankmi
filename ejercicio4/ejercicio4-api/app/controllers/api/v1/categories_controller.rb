module Api
	module V1
		class CategoriesController < ApplicationController

			def index
				@categories = Category.all
				render json: @categories				
			end
			

			def show
				logger.info "#{__method__}"
				id       = params[:id]
				@category= Category.find(id).extract_data
				render json: @category
			end


			# => Descripcion consumo Metodo Create 
			# => Content-Type: application/json
			# => accept: application/json
			# => accept-encoding: gzip, deflate
			# => accept-language: en-US,en;q=0.8
			# => content-type: application/json
			# => user-agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36
			# => Invocacion a traves de un hash con la siguiente estructura
			# => {"category":{"nombre":"Nueva categoria", "valor":"5", "descripcion":"descripcion de nueva categoria","padre_id":"10"}}
			
			def create
				
				begin

					@category = Category.new(allowed_params)
					@category.created_at = Date.today
					@category.updated_at = Date.today
					logger.info 'DER'
	    			if @category.save
	    				@category = Category.load_data(@category.id)
	    				render json: {category: @category.to_json, code: 201, message: 'Categoria creada con exito'}, status: 201
	    			else
	    				render json: {category: @category.to_json, code: 400, errors: @category.obj_errors.to_json}, status: 400
	    			end

				rescue Exception => e	      			
	      			Rails.logger.error "Error creando nueva categoria #{e.message}" 
	      			render json: {category: @category.to_json, code: 400, errors:e.message}, status: 400
	  			end
			end

			private
				def allowed_params
					Rails.logger.info "permitidos?"
					params.require(:category).permit(:nombre,:descripcion,:padre_id,:valor,:id)
				end
		end
	end
end