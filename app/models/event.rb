class Event < ActiveRecord::Base
  validates :title, presence: true,
            length: { maximum: 50 }
  has_many :prompts
end
