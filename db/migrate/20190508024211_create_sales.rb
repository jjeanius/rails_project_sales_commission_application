class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :product_name
      t.integer :sales_rate
      t.integer :quantity
      t.integer :commission_rate
      t.integer :commission_amount
      t.integer :employee_id
      t.integer :product_id

      t.timestamps
    end
  end
end
