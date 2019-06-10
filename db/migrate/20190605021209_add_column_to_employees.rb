class AddColumnToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :provider, :string
    add_column :employees, :uid, :string
  end
end
