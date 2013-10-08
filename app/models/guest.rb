class Guest < ActiveRecord::Base
  belongs_to :event
  validates :name, presence: true
  validates :affiliation, presence: true
end

