class AddActiveToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :active, :boolean
  end
end
