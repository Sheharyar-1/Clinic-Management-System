class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :admin, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :appointment_date, null: false
      t.string :status, null: false, default: 'upcoming'
      t.text :notes
      t.timestamps
    end
  end
end
