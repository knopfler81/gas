require 'rails_helper'


RSpec.describe Consumption do
	fixtures :consumptions

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

		visit consumptions_path
		expect(page).to have_content("Nombre de pleins: 2")
	end

end