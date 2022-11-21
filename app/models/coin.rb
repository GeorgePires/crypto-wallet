class Coin < ApplicationRecord
  belongs_to :mining_type
  validates_presence_of :description, :acronym, :url_image, on: :create, presence: true
end
