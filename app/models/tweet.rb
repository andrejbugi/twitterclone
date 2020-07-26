class Tweet < ApplicationRecord
  MINIMUM_TITLE_LENGTH = 5
  MAXIMUM_TITLE_LENGTH = 40
  MAXIMUM_BODY_LENGTH = 140

  validates :title, presence: true, length: { minimum: MINIMUM_TITLE_LENGTH,
                                              maximum: MAXIMUM_TITLE_LENGTH }
  validates :body, presence: true, length: { maximum: MAXIMUM_BODY_LENGTH }

  has_many :comments, dependent: :destroy
  belongs_to :user
end
