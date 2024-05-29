class CreateBookEmbeddings < ActiveRecord::Migration[7.1]
  def change
    create_table :book_embeddings do |t|
      t.references :book, null: false, foreign_key: true, index: { unique: true }
      t.column :embedding, :vector, limit: 1024

      t.timestamps
    end
  end
end
