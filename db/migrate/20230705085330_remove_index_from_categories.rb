# frozen_string_literal: true

class RemoveIndexFromCategories < ActiveRecord::Migration[7.0]
  def up
    remove_index :category, name: 'unique_name'
  end

  def down
    add_index :category, :name, name: 'unique_name', unique: true
  end
end
