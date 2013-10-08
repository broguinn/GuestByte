require 'spec_helper'

feature "Response" do
  before do
    visit root_path
    click_link "New event"
    fill_in "Title", :with => "Friday Drinks"
    select("2014", :from => "event_date_1i")
    select("10", :from => "event_date_2i")
    select("10", :from => "event_date_3i")
    fill_in "Host", :with => "Bobby Sue"
    click_on "Create event"
    fill_in "prompt_content", :with => 'How do you feel about foo?'
    click_on "Create prompt"
  end

  scenario 'A user sucessfully responds to an exisiting prompt' do
    fill_in "content", :with => 'It makes me think of foooood'
    click_on "Comment"
    expect(page).to have_content 'It makes me think of foooood'
  end

  scenario 'A user unsucessfully responds to an exisiting prompt' do
    fill_in "content", :with => ''
    click_on "Comment"
    expect(page).to have_content 'blank'
  end

end

