class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :translation_service, null: false, foreign_key: true
      t.string :date
      t.integer :final_cost

      t.timestamps
    end
  end
end
