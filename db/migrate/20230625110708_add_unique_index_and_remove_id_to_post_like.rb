class AddUniqueIndexAndRemoveIdToPostLike < ActiveRecord::Migration[7.0]
  def change
    add_index :post_likes, %i[post_id user_id], unique: true
  end
end
