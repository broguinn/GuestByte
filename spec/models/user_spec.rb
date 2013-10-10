require 'spec_helper'

describe User do
  it { should respond_to :name }
  it { should respond_to :encrypted_password }
  it { should respond_to :email }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :encrypted_password }

  it { should have_many :events }
end
