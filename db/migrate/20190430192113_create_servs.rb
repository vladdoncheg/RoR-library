class CreateServs < ActiveRecord::Migration[5.2]
  def change
    create_table :servs do |t|
      t.references :book, foreign_key: true
      t.references :reader, foreign_key: true
      t.date :start
      t.date :finish

      t.timestamps
    end
  end
end
