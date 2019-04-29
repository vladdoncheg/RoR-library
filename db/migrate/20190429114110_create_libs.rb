class CreateLibs < ActiveRecord::Migration[5.2]
  def change
    create_table :libs do |t|
      t.string :number
      t.text :name
      t.text :adress

      t.timestamps
    end
  end
end
