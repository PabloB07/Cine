class CreateJoinTableMoviesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :movies, :users do |t|
      t.references :movies, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
    end
  end
end
