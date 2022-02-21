class CreateSuperpowers < ActiveRecord::Migration[6.1]
  def change
    create_table :superpowers do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
