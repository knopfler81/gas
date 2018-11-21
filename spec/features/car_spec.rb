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
		fill_in "Car name", with: "Peugeot 307"
		click_on "Create Car"
		expect(page).to have_content("Mes consommations d'essence pour Peugeot 307")
		expect(page).to have_content("Le Véhicule a bien été créé.")
	end

	scenario "Edit a car" do
		car = cars(:telsa)
		visit car_path(car)
		click_on "Modifier ce véhicule"
		expect(page).to have_content "Edition d'un véhicule"
		fill_in "Car name", with: "Peugeot 308"
		click_on "Update Car"
		expect(page).to have_content("Peugeot 308")
		expect(page).to have_content("Le Véhicule a bien été mis à jour.")
	end	


	scenario "destroy a car" do
		car = cars(:telsa)
		visit car_path(car)
		click_on "Supprimer définitivement ce véhicule *"
		expect(page).to have_content("Le Véhicule a bien été supprimé.")
	end	
end