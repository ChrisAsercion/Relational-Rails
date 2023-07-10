require "rails_helper"

RSpec.describe "orchestras Info page", type: :feature do
  #As a visitor
  #When I visit '/parents/:parent_id/child_table_name'
  #Then I see each Child that is associated with that Parent with each Child's attributes

  describe "As a user" do
    describe "When I visit /parents/:parent_id/child_table_name" do
      it 'Then I see each Child that is associated with that Parent with each Childs attributes' do
        orch_1 = Orchestra.create!(name: "Example Orchestra", chairs: 100, conductor: "Anne Example", active: true, venue: true)
        musician_1 = Musician.create!(name: "Example Musician", instruments: "bassoon", songs: 10, on_call: true, orchestra_id: orch_1.id)
        visit "/orchestras/1/musicians"
        expect(page).to have_content(musician_1.name)
        expect(page).to_not have_content(musician_1.songs)
      end
    end
  end



end