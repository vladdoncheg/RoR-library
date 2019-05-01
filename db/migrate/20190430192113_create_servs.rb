class CreateServs < ActiveRecord::Migration[5.2]
  def change
    create_table :servs do |t|
      t.references :book, foreign_key: true, null: false
      t.references :reader, foreign_key: true, null: false
      t.date :start, null: false
      t.date :finish

      t.timestamps
    end
  end
end
