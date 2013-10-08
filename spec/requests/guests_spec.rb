require 'spec_helper'

feature "Attendee guestbook" do
    before do
        visit root_path
        click_link "New event"
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
    end 

    scenario "a user successfully adds self to the guestbook" do
        fill_in "Name", :with => "Prospective Employer"
        fill_in "Affiliation", :with => "Rich, fun company"
        click_on "Add me!"
        expect(page).to have_content("Thanks")
    end

    scenario "a user unsuccessfully adds self to the guestbook" do
        fill_in "Name", :with => ""
        fill_in "Affiliation", :with => ""
        click_on "Add me!"
        expect(page).to have_content("blank")
    end
end
