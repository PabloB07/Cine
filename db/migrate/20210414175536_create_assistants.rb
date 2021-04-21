class CreateAssistants < ActiveRecord::Migration[6.1]
  def change
    create_table :assistants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
