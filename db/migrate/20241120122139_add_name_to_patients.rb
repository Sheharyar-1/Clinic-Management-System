class AddNameToPatients < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :name, :string
  end
end
