class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :lib, foreign_key: true, null: false
      t.text :name, null: false
      t.text :author
      t.string :code, limit: 100, null: false
      t.text :publisher
      t.decimal :year, precision: 38, scale: 0
      t.decimal :price, precision: 10, scale: 2
      t.date :date

      t.timestamps
    end
  end
end
