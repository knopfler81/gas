class CarsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_car, only: [:show, :edit, :update, :destroy]

	def index
		@cars = Car.all
	end

	def show
		@search = ConsumptionSearch.new(params[:search])
		@consumptions = @search.date_range
		@consumptions = @consumptions.order('created_at ASC').where(car_id: @car.id)
	end

	def new
		@user = current_user
		@car = @user.cars.new
	end

	def create
		@user = current_user
		@car = @user.cars.new(car_params)
		@car.user = @user
    if @car.save!
     	redirect_to @car, notice: 'Le Véhicule a bien été créé.'
    else
      render :new
    end
	end

	def destroy
		if @car.destroy
			redirect_to cars_path, notice: 'Le Véhicule a bien été supprimé.'
		end
	end

	def edit
	end

	def update	
		if @car.update(car_params)
			redirect_to cars_path, notice: 'Le Véhicule a bien été mis à jour.'
		end
	end

	private

		def find_car
			@car = Car.find(params[:id])
		end

		def find_consumption
			@consumption = Consumption.find(params[:consumption_id])
		end

		def car_params
			params.require(:car).permit(:car_name, :image, :user_id)
		end
end
