class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :catorgory
      t.references :users
      t.timestamps
    end
  end
end
