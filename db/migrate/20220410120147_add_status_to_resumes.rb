class AddStatusToResumes < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :status, :integer, default: 0
  end
end
