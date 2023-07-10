require "rails_helper"

RSpec.describe "Musicians Index page", type: :feature do
  #as a user
  #when I visit `/musicians`
  #I should see the name of each musician record in the system
  describe "As a user" do
    describe "When I visit /musicians" do
      it 'I see each musicians record in the system' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        musician_1 = Musician.create!(name: "Example Musician", instruments: "bassoon", songs: 10, on_call: true, orchestra_id: orch_1.id)
        visit "/musicians"
        expect(page).to have_content(musician_1.name)
        expect(page).to_not have_content(musician_1.instruments)
        #save_and_open_page 
      end
    end

  end
end