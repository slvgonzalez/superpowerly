class AddCategoryToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :category, :string
  end
end
