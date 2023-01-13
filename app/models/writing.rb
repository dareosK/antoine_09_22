class Writing < ApplicationRecord
  belongs_to :user
  # validations
  validates :title, presence: true
  validates :tagline, presence: true
  validates :date, presence: true
  # cloudinary
  has_one_attached :cover
  # action text
  has_rich_text :rich_body
  # friendly URLS
  extend FriendlyId
  friendly_id :title, use: :slugged
end
