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

      it 'I see that records are ordered by most recently created first
      And next to each of the records I see when it was created' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        orch_2 = Orchestra.create!(name: "Example Orchestra 2", chairs: 50, conductor: "Anne Example", active: true, venue: true)
        musician_1 = Musician.create!(name: "Example Musician", instruments: "bassoon", songs: 10, on_call: true, orchestra_id: orch_1.id)
        visit "/orchestras"
        expect(page).to have_content(orch_1.created_at)
      end

      it 'I see a link at the top of the page that takes me to the Child Index' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        
        visit "/orchestras"
        expect(page).to have_content("Musician Index")
      end

      it 'I see a link at the top of the page that takes me to the Parent Index' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        
        visit "/orchestras"
        expect(page).to have_content("Orchestra Index")
      end

      #iteration 2

      #user story 11
      it 'Then I see a link to create a new Orchestra record, "New Orchestra" ' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)

        visit "/orchestras"
        expect(page).to have_content("New Orchestra")
        #expect(page).to has_link?(locater = "/orchestras/new",  "orchestras#new")
      end
    end
  end
end