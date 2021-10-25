class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :full_name
      t.string :address
      t.string :email
      t.string :phone_number
      t.string :weblinks
      t.timestamps
    end
  end
end
