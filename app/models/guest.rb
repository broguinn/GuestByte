class Guest < ActiveRecord::Base
  belongs_to :event
  validates :name, presence: true
  validates :affiliation, presence: true
  has_many :headshot_photos, :as => :capturable
end

