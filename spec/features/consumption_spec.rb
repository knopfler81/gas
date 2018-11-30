require 'rails_helper'

RSpec.describe Consumption do
	fixtures :consumptions, :users, :cars


	before(:each) do 
		login_as :nelly
	end

	scenario "list all consumptions" do
		car = cars(:peugeot)

		visit car_path(car)
		expect(page).to have_content("Mes consommations d'essence")
	end

	scenario "create a new consumption" do 
		car = cars(:peugeot)
		visit new_car_consumption_path(car)
		expect(page).to have_content("Enregistrer un nouveau plein")

		fill_in "Kilometers",  with: "500"
		fill_in "Liter price", with: "1.53"
		fill_in "Total price", with: "60"
		fill_in "Shop", with: "Total"
		click_on "Enregistrer"
		expect(page).to have_content("Mes consommations d'essence")
	end

	scenario "display the summary" do
		car = cars(:peugeot)
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit car_path(car)
		expect(page).to have_content("Remplissages utilisés : 2")
	end

	scenario "display the number of kilometers done" do 
		car = cars(:peugeot)
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit car_path(car)
		expect(page).to have_content("Nombre de kilomètres parcourus : 1450")
	end

	scenario "display the number of kilometers between two fillin", :skip do 
		car = cars(:peugeot)
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit car_path(car)
		expect(page).to have_content(800)
		expect(page).to have_content(650)
	end

	scenario "display the averrage price per km" do 
		car = cars(:peugeot)
		consumptions(:first)
		consumptions(:second)
		consumptions(:third)

		visit car_path(car)
		expect(page).to have_content("Moyenne du prix au km : 0.0952 €")
	end

end