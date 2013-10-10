require 'spec_helper'

feature "New event" do
  scenario "a user successfully creates a new event" do
    visit new_event_path
    fill_in "Title", :with => "Friday Drinks"
    select("2014", :from => "event_date_1i")
    select("10", :from => "event_date_2i")
    select("10", :from => "event_date_3i")
    fill_in "Host", :with => "Bobby Sue"
    fill_in "Location", :with => "Rimsky-Korsakoffee"
    select("11", :from => "event_start_time_4i")
    select("11", :from => "event_start_time_5i")
    select("12", :from => "event_end_time_4i")
    select("12", :from => "event_end_time_5i")
    fill_in "Description", :with => "Victorian-era cocktails and desserts with my cousin-sister"
    click_on "Create event"
    expect(page).to have_content 'created'
    expect(page).to have_content 'Friday Drinks'
  end

  scenario "a user unsuccessfully creates a new event" do
    visit new_event_path
    fill_in "Title", :with => ""
    click_on "Create event"
    expect(page).to have_content 'blank'
  end
end




