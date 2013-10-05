require 'spec_helper'

feature "New event" do
  scenario "a user successfully creates a new event" do
    visit root_path
    click_link "New event"
    fill_in "Title", :with => "Friday Drinks"
    fill_in "Date", :with => "10/10/2010"
    fill_in "Host", :with => "Bobby Sue"
    click_on "Create event"
    expect(page).to have_content 'created'
  end

  scenario "a user unsuccessfully creates a new event" do
    visit root_path
    click_link "New event"
    fill_in "Title", :with => ""
    click_on "Create event"
    expect(page).to have_content 'blank'
  end
end
