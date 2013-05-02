class AddUniqueIndexes < ActiveRecord::Migration
  def change
    add_index :categories, :title, unique: true
    add_index :products, :title, unique: true
    add_index :users, :email, unique: true
  end
end
