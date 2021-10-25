class CreatePublication < ActiveRecord::Migration[6.1]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :description
      t.date :released_date
      t.timestamps
    end
  end
end
