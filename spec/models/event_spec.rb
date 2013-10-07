require 'spec_helper'

describe Event do

  it { should validate_presence_of :title }
  it { should respond_to :title }
  it { should respond_to :date }
  it { should respond_to :host }
  it { should respond_to :prompts }
  it { should ensure_length_of(:title).is_at_most(50) }

  it { should have_many :prompts }

end
