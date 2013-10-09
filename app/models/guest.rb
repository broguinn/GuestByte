class Guest < ActiveRecord::Base
  belongs_to :event
  has_many :photos
  validates :name, presence: true
  validates :affiliation, presence: true
  # attr_accessor :avatar, :avatar_file_name, :avatar_content_type,
  #               :avatar_file_size, :photo_updated_at
  
end
