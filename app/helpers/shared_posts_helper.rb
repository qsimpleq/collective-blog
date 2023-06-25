module SharedPostsHelper
  def post_liked(post)
    return nil if !user_signed_in? || post.post_likes.empty?

    post.post_likes.find_by(user_id: current_user.id)
  end
end
