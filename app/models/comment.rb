class Comment < ApplicationRecord
  belongs_to :tweet
  has_one :tweet
end
