# frozen_string_literal: true

class UpdateAncestryToPostComments < ActiveRecord::Migration[7.0]
  def change
    change_column_default :post_comments, :ancestry, from: nil, to: '/'
  end
end
