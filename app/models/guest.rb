class Guest < ActiveRecord::Base
  belongs_to :event
  validates :name, presence: true
  validates :affiliation, presence: true
  has_many :headshot_photos, :as => :capturable
  attr_accessor :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end

