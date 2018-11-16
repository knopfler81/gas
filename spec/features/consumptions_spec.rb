require 'rails_helper'

RSpec.describe Consumption do
	fixtures :consumptions, :users


	before(:each) do 
		login_as :nelly
	end

	scenario "list all consumptions" do
		visit consumptions_path
		expect(page).to have_content("Mes consommations d'essence")
	end

	scenario "create a new consumption" do 
		visit new_consumption_path
		expect(page).to have_content("Enregistrer un nouveau plein")

		fill_in "Kilometers",  with: "500"
		fill_in "Liter price", with: "1.53"
		fill_in "Total price", with: "60"
		fill_in "Shop", with: "Total"
		click_on "Create Consumption"
		expect(page).to have_content("Mes consommations d'essence")
	end

	scenario "display the summary" do
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit consumptions_path
		expect(page).to have_content("Remplissages utilisés : 2")
	end


	scenario "display the number of kilometers done" do 
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit consumptions_path
		expect(page).to have_content("Nombre de kilomètres parcourus : 1450.0")
	end


	scenario "display the number of kilometers between two fillin" do 
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit consumptions_path
		expect(page).to have_content(800)
		expect(page).to have_content(650)
	end

	scenario "display the averrage price per km" do 
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit consumptions_path
		save_and_open_page
		expect(page).to have_content("Moyenne du prix au km : 0.095 €")
	end

end