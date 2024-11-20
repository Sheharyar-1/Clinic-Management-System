class AddEmailToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_column :appointments, :email, :string
  end
end
