require "rails_helper"

RSpec.describe Car do
	fixtures :users, :cars

	before(:each) do 
		login_as :nelly
	end
	
	scenario "Create a car" do 
		visit root_path
		click_on "Ajouter un véhicule"
		expect(page).to have_content("Ajout d'un véhicule")
		fill_in "car[car_name]", with: "Peugeot 307"
		click_on "Valider"
		expect(page).to have_content("Mes consommations d'essence")
		expect(page).to have_content("Le Véhicule a bien été créé.")
	end

	scenario "Edit a car" do
		car = cars(:telsa)
		visit car_path(car)
		find(".edit_car").click
		expect(page).to have_content "Edition d'un véhicule"
		fill_in "car[car_name]", with: "Peugeot 308"
		click_on "Valider"
		expect(page).to have_content("Peugeot 308")
		expect(page).to have_content("Le Véhicule a bien été mis à jour.")
	end	


	scenario "destroy a car" do
		car = cars(:telsa)
		visit car_path(car)
		find(".delete_car").click
		expect(page).to have_content("Le Véhicule a bien été supprimé.")
	end	
end