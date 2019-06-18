class Event < ApplicationRecord
  has_and_belongs_to_many :tags
  mount_uploader :image, ImageUploader

end
