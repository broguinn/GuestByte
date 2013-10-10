require 'spec_helper'

feature 'Add users' do

  scenario "a user successfully signs up for the website" do
    visit root_path
    click_link "Get started!"
    fill_in "Name", :with => "Party Girl"
    fill_in "Email", :with => "parkerposey@party.com"
    fill_in "Password", :with => "partygirl"
    fill_in "Password confirmation", :with => "partygirl"
    click_on "Sign up"
    expect(page).to have_content("successfully")
  end

  scenario "a user unsuccessfully signs up for the website" do
    visit root_path
    click_link "Get started!"
    fill_in "Name", :with => ""
    click_on "Sign up"
    expect(page).to have_content("blank")
  end

  scenario "when a user visits the main page they have the option to sign in" do
    visit root_path
    expect(page).to have_content("Sign in")
  end

  scenario "when users are not signed in they cannot access My Events" do
    visit user_events_path(1)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario "when a user successfully signs up for the sign they remains logged in" do
    visit root_path
    click_link "Get started!"
    fill_in "Name", :with => "Party Girl"
    fill_in "Email", :with => "parkerposey@party.com"
    fill_in "Password", :with => "partygirl"
    fill_in "Password confirmation", :with => "partygirl"
    click_on "Sign up"
    expect(page).to have_content("My Events")
  end


  scenario "a user signs in and has the option to sign out" do 
    visit root_path
    click_link "Get started!"
    fill_in "Name", :with => "Party Girl"
    fill_in "Email", :with => "parkerposey@party.com"
    fill_in "Password", :with => "partygirl"
    fill_in "Password confirmation", :with => "partygirl"
    click_on "Sign up"
    expect(page).to have_content("Sign out")
  end
end