# frozen_string_literal: true

module SharedPostsHelper
  def post_liked(post)
    return nil if !user_signed_in? || post.likes.empty?

    post.likes.find_by(user_id: current_user.id)
  end
end
