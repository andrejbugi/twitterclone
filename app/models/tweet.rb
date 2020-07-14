class Tweet < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { maximum: 140 }
  has_many :comments, dependent: :destroy
  belongs_to :user
end
