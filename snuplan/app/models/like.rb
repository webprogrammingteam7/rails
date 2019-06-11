class Like < ApplicationRecord
  has_many :events, validate: false
  belongs_to :user
end
