require 'spec_helper'

describe 'Sessions' do
  subject {page}

  describe 'Without a signed-in user' do
    
  end

  describe 'With a signed-in user' do
    before do
      visit new_user_registration_path
      fill_in "Name", :with => "Party Girl"
      fill_in "Email", :with => "parkerposey@party.com"
      fill_in "Password", :with => "partygirl"
      fill_in "Password confirmation", :with => "partygirl"
      click_on "Sign up"
      Event.create(title: 'Kazoo Recital')
    end

    it 'can create a new event' do
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
      click_on 'My Events'
      #I really like these strings
      expect(page).to have_content('Friday Drinks')
      expect(page).to_not have_content('Kazoo Recital')
    end
  end
end