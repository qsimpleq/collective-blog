# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :category, foreign_key: true, null: false, index: true
      t.references :creator, class_name: :user, index: true

      t.timestamps
    end
  end
end
