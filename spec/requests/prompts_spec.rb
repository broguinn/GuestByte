require 'spec_helper'

feature 'Prompts' do
  
  before do
    visit root_path
    click_link "New event"
    fill_in "Title", :with => "Friday Drinks"
    fill_in "Date", :with => "10/10/2010"
    fill_in "Host", :with => "Bobby Sue"
    click_on "Create event"
  end

  scenario 'A user creates a new prompt for the event' do
    click_link "New prompt"
    fill_in "Content", :with => 'How do you feel about foo?'
    click_on "Create prompt"
    expect(page).to have_content 'How do you feel about foo?'
  end

  scenario 'A user creates a new prompt for the event' do
    click_link "New prompt"
    fill_in "Content", :with => ''
    click_on 'Create prompt'
    expect(page).to have_content 'blank'
  end
end