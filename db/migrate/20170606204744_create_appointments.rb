class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :patient, foreign_key: true
      t.date :date, null: false
      t.time :time, null: false
      t.string :clinic, null: false

      t.timestamps
    end
  end
end
