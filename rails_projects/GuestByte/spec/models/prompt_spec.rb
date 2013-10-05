require 'spec_helper'

describe Prompt do
  it { should respond_to :event }
  it { should belong_to :event }
  it { should have_many :responses }
  it { should validate_presence_of :content }
end
