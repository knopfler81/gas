class ConsumptionsController < ApplicationController
	before_action :find_consumption, only: [:edit, :update, :destroy]
	before_action :find_car
	before_action :authenticate_user!

	def new
		@user = current_user
		@car = Car.find(params[:car_id])
		@consumption = Consumption.new
	end

	def create 
		@user = current_user
		@car = Car.find(params[:car_id])
		@consumption = Consumption.new(consumption_params)
		@consumption.user = @user
		@consumption.car = @car
  	if @consumption.save!
     	redirect_to @car, notice: 'Consumption was successfully created.'
    else
 			render :new
    end
	end

	def edit
	end

	def update
		if @consumption.update!(consumption_params)
		 redirect_to @car, notice: 'Consumption was successfully created.'
		end		
	end

	def destroy
		redirect_to @car if @consumption.destroy!
	end

	private

		def find_consumption
			@consumption = Consumption.find(params[:id])
		end

		def find_car 
			@car = Car.find(params[:car_id])
		end

		def consumption_params
			params.require(:consumption).permit(:total_price, :total_liters, :kilometers, :shop, :liter_price, :user_id, :car_id)
		end
end
