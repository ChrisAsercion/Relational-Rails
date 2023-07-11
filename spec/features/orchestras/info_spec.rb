require "rails_helper"

RSpec.describe "orchestras Info page", type: :feature do
  #As a visitor
  #When I visit '/orchestra/:id'
  #Then I see the parent with that id including the parent's attributes
  describe "As a user" do
    describe "When I visit /orchestras/:id" do
      it 'I see the orchestra with that id including the orchestras attributes' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)

        visit "/orchestras/#{orch_1.id}"
        expect(page).to have_content(orch_1.conductor)
        expect(page).to have_content(orch_1.chairs)
      end
      it 'I see a count of the number of children associated with this parent' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        musician_1 = Musician.create!(name: "Example Musician", instruments: "bassoon", songs: 10, on_call: true, orchestra_id: orch_1.id)
        musician_2 = Musician.create!(name: "Example Musician 2", instruments: "clarinet", songs: 10, on_call: true, orchestra_id: orch_1.id)
        
        visit "/orchestras/#{orch_1.id}"
        expect(page).to have_content(2)
      end

      it 'Then I see a link to take me to that parents child_table_name' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        musician_1 = Musician.create!(name: "Example Musician", instruments: "bassoon", songs: 10, on_call: true, orchestra_id: orch_1.id)
        musician_2 = Musician.create!(name: "Example Musician 2", instruments: "clarinet", songs: 10, on_call: true, orchestra_id: orch_1.id)

        visit "/orchestras/#{orch_1.id}"
        click_on 'Example Orchestra Musician Information'
        expect(page).to have_content(musician_1.name)
        expect(page).to have_content(musician_2.name)
      end

      #iteration 2
      #user story 12

      it 'Then I see a link to update the parent "Update Parent"' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        visit "/orchestras/#{orch_1.id}"
        click_on 'Update Orchestra'

      end

    
    end
  end
end