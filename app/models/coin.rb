class Coin < ApplicationRecord
  validates_presence_of :description, :acronym, :url_image, on: :create, presence: true
end
