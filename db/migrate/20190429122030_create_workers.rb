class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.references :lib, foreign_key: true, null: false
      t.string :lastname, limit: 100, null: false
      t.string :firstname, limit: 100, null: false
      t.string :fathername, limit: 100
      t.date :birthday
      t.date :workdate
      t.text :position, null: false
      t.string :education, limit: 100

      t.timestamps
    end
  end
end
