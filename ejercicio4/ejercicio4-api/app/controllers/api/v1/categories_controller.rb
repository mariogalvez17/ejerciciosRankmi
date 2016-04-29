module Api
	module V1
    	class CategoriesController < ApplicationController
     		respond_to :json

			def show
			respond_with Categorie.find(params[:id])
			end

			def create
			respond_with Categorie.create(params[:categorie],params[:padre])
			end

		end
  	end
end