class Change < ActiveRecord::Migration[6.1]
  def change
    remove_column :ads, :users_id
  end
end
