require 'spec_helper'

describe Prompt do
  it { should respond_to :event }
  it { should belong_to :event }
  it { should have_many :responses }
  it { should validate_presence_of :content }

  describe '#newest_responses' do
    it 'returns responses in the ascending order of creation' do
      prompt = Prompt.create(content: 'Jogging Club Memories')
      response1 = prompt.responses.create(content: 'That time Jeb threw up on my new Nikes')
      response2 = prompt.responses.create(content: 'Tying coach\'s laces together')
      response3 = prompt.responses.create(content: 'Being 50 and realizing I have irreparable damage to the joints in my legs')
      prompt.responses_by_newest.should eq [response3, response2, response1]
    end
  end

end
