class Project < ApplicationRecord
  has_one_attached :cover
  has_many_attached :photos
  # validations
  validates :title, presence: true
  validates :tagline, presence: true
  validates :date, presence: true
  # action text
  has_rich_text :rich_body
end
