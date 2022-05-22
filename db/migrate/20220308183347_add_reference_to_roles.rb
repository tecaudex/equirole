class AddReferenceToRoles < ActiveRecord::Migration[6.1]
  def change
    add_reference :resumes, :role, null: false, foreign_key: true
  end
end
