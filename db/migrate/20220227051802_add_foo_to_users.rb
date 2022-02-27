class AddFooToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :foo, :string
  end
end
