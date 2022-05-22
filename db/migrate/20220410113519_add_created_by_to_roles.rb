class AddCreatedByToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :created_by, :integer
  end
end
