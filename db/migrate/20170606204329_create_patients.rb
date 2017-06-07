class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end
