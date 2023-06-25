module SharedPostsHelper
  def post_liked(post)
    @post_liked ||= calculate_post_liked(post)
  end

  private

  def calculate_post_liked(post)
    user_signed_in? && post.post_likes.any? && post.post_likes.find_by(user_id: current_user.id)
  end
end
