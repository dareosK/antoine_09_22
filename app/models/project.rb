class Project < ApplicationRecord
  has_one_attached :cover
  has_many_attached :photos
end
