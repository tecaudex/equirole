class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :position
      t.string :category
      t.timestamps
    end
  end
end
