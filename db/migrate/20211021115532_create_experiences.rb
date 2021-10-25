class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.date :from_date
      t.date :to_date
      t.string :company_name
      t.string :position
      t.string :description
      t.timestamps
    end
  end
end
