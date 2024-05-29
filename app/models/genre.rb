class Genre < ApplicationRecord
  has_many :books_genres, dependent: :delete_all
  has_many :books, through: :books_genres
  validates :label, presence: true, uniqueness: true
end
