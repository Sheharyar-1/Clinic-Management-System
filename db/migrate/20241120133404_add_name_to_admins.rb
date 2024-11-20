class AddNameToAdmins < ActiveRecord::Migration[7.2]
  def change
    add_column :admins, :name, :string
    add_column :admins, :speaciality, :string
    add_column :admins, :hospital, :string
  end
end
