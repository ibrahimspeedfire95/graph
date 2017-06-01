class MaterialsController < ApplicationController
	before_action :set_material, only: [:destroy]

	def index
		@materials = Material.all

		render json: @materials
	end

	def create
		@material = Material.new(material_params)

		if @material.save
			render json: @material, status: :created
		else
			render json: @material.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		@material.destroy
	end

	private

	def set_material
		@material = Material.find(params[:id])
	end

	def material_params
		params.permit(:name, :material_type, :price, :course_id)
	end

end
