class AddUserReferenceToSuperpowers < ActiveRecord::Migration[6.1]
  def change
    add_reference :superpowers, :user, null: false, foreign_key: true
  end
end
