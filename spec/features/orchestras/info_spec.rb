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
    end
  end
end