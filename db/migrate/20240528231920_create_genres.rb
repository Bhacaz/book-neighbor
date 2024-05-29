class CreateGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :genres do |t|
      t.string :label

      t.timestamps

      t.index :label, unique: true
    end
  end
end
