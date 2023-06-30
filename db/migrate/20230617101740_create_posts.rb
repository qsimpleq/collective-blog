# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :category, foreign_key: true, null: false, index: true

      t.timestamps
    end

    add_reference(:posts, :creator, index: true, foreign_key: { to_table: :users })
  end
end
