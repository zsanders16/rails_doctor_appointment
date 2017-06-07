class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :specialty, null: false

      t.timestamps
    end
  end
end
