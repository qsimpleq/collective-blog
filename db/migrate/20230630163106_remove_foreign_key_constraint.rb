# frozen_string_literal: true

class RemoveForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, :users, column: 'creator_id'
  end
end
