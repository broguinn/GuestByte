class Prompt < ActiveRecord::Base
  belongs_to :event
  has_many :responses
  validates :content, presence: true
end
