class AddRawdataToResumes < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :raw_data, :string
  end
end
