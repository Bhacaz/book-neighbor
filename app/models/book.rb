class Book < ApplicationRecord
  has_many :books_genres, dependent: :delete_all
  has_many :genres, through: :books_genres

  validates :isbn, presence: true, uniqueness: true
end
