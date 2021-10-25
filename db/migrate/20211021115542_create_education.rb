class CreateEducation < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.date :from_date
      t.date :to_date
      t.string :institute
      t.string :degree_title
      t.timestamps
    end
  end
end
