class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :name
      t.text :author
      t.string :code
      t.string :publisher
      t.integer :year
      t.decimal :price, precision: 10, scale: 2
      t.date :date
      t.references :lib, foreign_key: true

      t.timestamps
    end
  end
end
