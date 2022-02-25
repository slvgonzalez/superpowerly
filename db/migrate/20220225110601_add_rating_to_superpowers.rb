class AddRatingToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :rating, :float
  end
end
