class ConsumptionsController < ApplicationController
	def index
		@consumptions = Consumption.order(created_at: :desc)
	end

	def new 
		@consumption = Consumption.new
	end

	def create
		@consumption = Consumption.new(consumption_params)
	  respond_to do |format|
	    if @consumption.save
	      format.html { redirect_to consumptions_path, notice: 'consumption was successfully created.' }
	      format.json { render :index, status: :created, location: @consumptions }
	    else
	      format.html { render :new }
	      format.json { render json: @consumption.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def show
		@consumption = Consumption.find(prarams[:id])
	end

	private

		def consumption_params
			params.require(:consumption).permit(:total_price, :total_liters, :kilometers, :shop, :liter_price)
		end
end
