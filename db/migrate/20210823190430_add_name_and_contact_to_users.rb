class AddNameAndContactToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :string
  end
end
