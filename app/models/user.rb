class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # cloudinary
  has_one_attached :avatar
  has_one_attached :cv
  has_many_attached :moodboard

  # action text
  has_rich_text :rich_bio
end
