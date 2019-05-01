class CreateLibs < ActiveRecord::Migration[5.2]
  def change
    create_table :libs do |t|
      t.string :number, limit: 100, null: false
      t.text :name, null: false
      t.text :adress, null: false

      t.timestamps
    end
  end
end
