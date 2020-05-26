class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :content, uniqueness: true
end
