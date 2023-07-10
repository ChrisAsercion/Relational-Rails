require "rails_helper"

RSpec.describe "orchestras Index page", type: :feature do
  #as a user
  #when I visit `/orchestras`
  #I should see the name of each orchestra record in the system
  describe "As a user" do
    describe "When I visit /orchestras" do
      it 'I see each orchestras record in the system' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        
        visit "/orchestras"
        expect(page).to have_content(orch_1.name)
        expect(page).to_not have_content(orch_1.chairs)
        #save_and_open_page 
      end
  end
end