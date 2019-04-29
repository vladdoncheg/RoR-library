class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :lastname
      t.string :firstname
      t.string :fathername
      t.date :birthday
      t.date :workdate
      t.string :position
      t.string :education
      t.references :lib, foreign_key: true

      t.timestamps
    end
  end
end
