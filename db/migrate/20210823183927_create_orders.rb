class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :translation_service_id, null: false, foreign_key: true
      t.string :date
      t.integer :final_cost

      t.timestamps
    end
  end
end
