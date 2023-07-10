require "rails_helper"

RSpec.describe "orchestras Info page", type: :feature do
  #As a visitor
  #When I visit '/musicians/:id'
  #Then I see the parent with that id including the parent's attributes
  describe "As a user" do
    describe "When I visit /musicians/:id" do
      it 'I see the musician with that id including the musician attributes' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        musician_1 = Musician.create!(name: "Example Musician", instruments: "bassoon", songs: 10, on_call: true, orchestra_id: orch_1.id)
        visit "/musicians/#{musician_1.id}"
        expect(page).to have_content(musician_1.name)
        expect(page).to have_content(musician_1.instruments)
        expect(page).to_not have_content(orch_1.chairs)
        #save_and_open_page 
      end
    end
  end
end