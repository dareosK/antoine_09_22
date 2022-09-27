class Writing < ApplicationRecord
  belongs_to :user

  has_one_attached :cover

  has_rich_text :rich_body
end
