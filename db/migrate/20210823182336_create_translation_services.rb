class CreateTranslationServices < ActiveRecord::Migration[6.0]
  def change
    create_table :translation_services do |t|
      t.text :location
      t.boolean :remote
      t.string :original_language
      t.string :final_language
      t.float :price_per_hour
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
