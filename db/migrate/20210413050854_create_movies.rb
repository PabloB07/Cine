class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :movie
      t.text :description
      t.integer :movies
      t.integer :price

      t.timestamps
    end
  end
end
