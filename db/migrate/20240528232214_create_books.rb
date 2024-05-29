class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :series
      t.string :author
      t.text :description
      t.string :language
      t.string :isbn
      t.integer :page
      t.date :publish_date
      t.string :cover_url
      t.float :rating

      t.timestamps
      t.index :isbn, unique: true
    end
  end
end
