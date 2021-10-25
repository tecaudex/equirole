class AddReferenceToAd < ActiveRecord::Migration[6.1]
  def change
    add_reference :ads, :user, index: true
  end
end
