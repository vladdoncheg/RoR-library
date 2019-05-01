class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |t|
      t.references :lib, foreign_key: true
      t.decimal :number, precision: 38, scale: 0, null: false
      t.string :lastname, limit: 100, null: false
      t.string :firstname, limit: 100, null: false
      t.string :fathername, limit: 100
      t.text :adress, null: false
      t.numeric :phone, precision: 38, scale: 0, null: false

      t.timestamps
    end
  end
end
