class Response < ActiveRecord::Base
  belongs_to :prompt
  validates :content, presence: :true

  def age_in_minutes
    ((Time.now - created_at)/60).floor
  end
end
