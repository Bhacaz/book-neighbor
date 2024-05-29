class CreateBookGenres < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :genres do |t|
      t.index %i[book_id genre_id]
    end
  end
end
