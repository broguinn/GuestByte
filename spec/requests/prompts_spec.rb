require 'spec_helper'

feature 'Prompts' do
  
  before do
    visit root_path
    click_link "Get started!"
    fill_in "Name", :with => "Party Girl"
    fill_in "Email", :with => "parkerposey@party.com"
    fill_in "Password", :with => "partygirl"
    fill_in "Password confirmation", :with => "partygirl"
    click_on "Sign up"
    visit new_event_path
    fill_in "Title", :with => "Friday Drinks"
    select("2014", :from => "event_date_1i")
    select("10", :from => "event_date_2i")
    select("10", :from => "event_date_3i")
    fill_in "Host", :with => "Bobby Sue"
    click_on "Create event"
  end

  scenario 'A user creates a new prompt for the event' do
    fill_in "prompt_content", :with => 'How do you feel about foo?'
    click_on "Create prompt"
    expect(page).to have_content 'How do you feel about foo?'
  end

  scenario 'A user creates a new prompt for the event' do
    fill_in "prompt_content", :with => ''
    click_on 'Create prompt'
    expect(page).to have_content 'blank'
  end
end