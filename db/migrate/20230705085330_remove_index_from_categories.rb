class RemoveIndexFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_index :category, name: 'unique_name'
  end
end
