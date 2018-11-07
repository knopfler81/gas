class ConsumptionsController < ApplicationController
	before_action :find_consumption, only: [:edit, :destroy, :update]
	before_action :authenticate_user!

	def index
		@search = ConsumptionSearch.new(params[:search])
		@consumptions = @search.date_range
	end

	def new 
		@consumption = Consumption.new
	end

	def create
		@consumption = Consumption.new(consumption_params)
		@consumption.user = current_user
    if @consumption.save
     	redirect_to consumptions_path, notice: 'consumption was successfully created.'
    else
      render :new
    end
	end

	def edit
	end

	def update
		if @consumption.update(consumption_params)
		 redirect_to consumptions_path, notice: 'consumption was successfully created.'
		end		
	end

	def destroy
		redirect_to consumptions_path if @consumption.destroy!

	end

	def show
		@consumption = Consumption.find(prarams[:id])
	end

	private

		def find_consumption
			@consumption = Consumption.find(params[:id])
		end

		def find_user
			@user = User.find(params[:user_id])
		end

		def consumption_params
			params.require(:consumption).permit(:total_price, :total_liters, :kilometers, :shop, :liter_price, :user_id)
		end

		def selected_month(desired_month)
			Consumption.where('extract(month from created_at) = ?', desired_month)
		end
end
