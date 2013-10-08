require 'spec_helper'

describe Guest do
  it { should respond_to :event }
  it { should belong_to :event }
  it { should validate_presence_of :name }
  it { should validate_presence_of :affiliation }
end
