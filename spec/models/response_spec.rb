require 'spec_helper'

describe Response do
  it { should validate_presence_of :content }
  it { should belong_to :prompt }

  describe 'minutes_since' do
    it 'returns the number of minutes since a response was posted' do
      Timecop.freeze(2013, 10, 7, 11, 5, 0)
      response = Response.create(:content => "freeze time!", :prompt_id => 2)
      t2 = Timecop.travel(2013, 10, 7, 11, 9, 0)
      response.age_in_minutes.should eq 4 
      Timecop.return
    end  
  end
end
