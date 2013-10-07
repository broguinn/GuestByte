require 'spec_helper'

feature "Response" do
  before do
    visit root_path
    click_link "New event"
    fill_in "Title", :with => "Friday Drinks"
    fill_in "Date", :with => "10/10/2010"
    fill_in "Host", :with => "Bobby Sue"
    click_on "Create event"
    click_link "New prompt"
    fill_in "Content", :with => 'How do you feel about foo?'
    click_on "Create prompt"
    click_on "Respond"
  end

  scenario 'A user sucessfully responds to an exisiting prompt' do
    fill_in "response_content", :with => 'It makes me think of foooood'
    click_on "Comment"
    expect(page).to have_content 'It makes me think of foooood'
  end

  scenario 'A user unsucessfully responds to an exisiting prompt' do
    fill_in "response_content", :with => ''
    click_on "Comment"
    save_and_open_page
    expect(page).to have_content 'blank'
  end
end

