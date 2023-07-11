require "rails_helper"

RSpec.describe "orchestras Index page", type: :feature do
  #When I visit the Parent Index page
  it 'Then I see a link to create a new Orchestra record, "New Orchestra"' do
    visit '/orchestras'
    expect(page).to have_content("New Orchestra")
  end
  
end