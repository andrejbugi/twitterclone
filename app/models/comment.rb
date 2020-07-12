class Comment < ApplicationRecord
  belongs_to :tweet
  validates :author, presence: true
  validates :body, presence: true
end
