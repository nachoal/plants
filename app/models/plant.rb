class Plant < ApplicationRecord
  has_many :plant_tags
  has_many :tags, through: :plant_tags

  belongs_to :garden

  validates :name, :image_url, presence: true
end