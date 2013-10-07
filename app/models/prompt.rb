class Prompt < ActiveRecord::Base
  belongs_to :event
  has_many :responses
  validates :content, presence: true

  def responses_by_newest
    self.responses.sort_by{|response| response.created_at}.reverse
  end
end
