class Project < ApplicationRecord
  has_one_attached :cover
  has_many_attached :photos

  # validations
  validates :project_type, inclusion: { in: %w(exhibition project) }

  has_rich_text :rich_body
end
