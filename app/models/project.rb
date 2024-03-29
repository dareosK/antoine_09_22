class Project < ApplicationRecord
  has_one_attached :cover
  has_many_attached :photos

  # validations
  validates :project_type, inclusion: { in: %w(exhibition project) }
  validates :project_type, presence: true
  validates :title, presence: true
  validates :tagline, presence: true
  validates :date, presence: true
  validates :project_type, presence: true

  # action text
  has_rich_text :rich_body

  # friendly URLS
  extend FriendlyId
  friendly_id :title, use: :slugged
end
