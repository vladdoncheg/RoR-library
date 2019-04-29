class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |t|
      t.integer :number
      t.string :lastname
      t.string :firstname
      t.string :fathername
      t.text :adress
      t.integer :phone
      t.references :lib, foreign_key: true

      t.timestamps
    end
  end
end
