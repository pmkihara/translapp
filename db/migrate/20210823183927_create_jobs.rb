class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.string :status, null: false, default: "accepted"
      t.string :date, null: false
      t.float :final_cost, null: false

      t.timestamps
    end
  end
end
