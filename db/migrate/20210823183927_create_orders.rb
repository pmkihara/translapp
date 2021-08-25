class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :translation_service, null: false, foreign_key: true
      t.string :status, null: false, default: "active"
      t.string :date, null: false
      t.float :final_cost, null: false

      t.timestamps
    end
  end
end
