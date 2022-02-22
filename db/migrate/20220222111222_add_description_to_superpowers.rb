class AddDescriptionToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_column :superpowers, :description, :string
  end
end
