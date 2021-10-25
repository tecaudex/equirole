class AddImageToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :image, :string
  end
end
