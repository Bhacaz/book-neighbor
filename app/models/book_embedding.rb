class BookEmbedding < ApplicationRecord
  belongs_to :book
  has_neighbors :embedding

  def similar_books(limit: 15)
    scope = nearest_neighbors(:embedding, distance: "euclidean").limit(limit)

    book_ids = scope.pluck(:book_id)
    Book.where(id: book_ids)
  end
end
