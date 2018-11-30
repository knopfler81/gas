require "rails_helper"

describe ConsumptionsHelper do

	fixtures :users, :consumptions

	before(:each) do 
		@consumptions = [consumptions(:first), consumptions(:second), consumptions(:third)]
	end

  describe "#fill_in_count" do
    it "returns the numbers of fillin" do
    	expect(helper.fill_in_count).to eql(2)    
    end
  end

  describe "#total_fillin_prices" do
  	it "returns the total price amount" do 
  		expect(helper.total_fillin_prices).to eql(138.0)
  	end
  end

  describe "#averrage_per_km" do 
  	it "returns the price avverage per km" do 
  		expect(helper.averrage_per_km).to eql(0.09517241379310344)
  	end
  end

  describe "#averrage_for_100km" do 
  	it "returns the price avverage for 100 km" do 
  		expect(helper.averrage_for_100km).to eql(9.517241379310343)
  	end
  end

  describe "#difference" do 
  	it "returns the difference of km done with last fill in" do 
  		c = @consumptions.last
  		expect(helper.difference(c, 2)).to eql(650)
  	end
  end


  describe "#total_km" do 
  	it "returns the total of km done" do 
  		expect(helper.total_km).to eql(1450)
  	end
  end


end