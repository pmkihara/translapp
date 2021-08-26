class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.text :location
      t.boolean :remote, null: false, default: false
      t.string :original_language, null: false
      t.string :final_language, null: false
      t.text :description
      t.float :price_per_hour, null: false, default: 0.0
      t.integer :service_hours, null: false, default: 1
      t.string :status, null: false, default: "available"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
