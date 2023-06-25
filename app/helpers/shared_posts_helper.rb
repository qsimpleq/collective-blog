module SharedPostsHelper
  def post_liked(post)
    @post_liked ||= {}
    @post_liked[post.id] ||= calculate_post_liked(post)
    @post_liked[post.id]
  end

  private

  def calculate_post_liked(post)
    return nil if !user_signed_in? || post.post_likes.empty?
    post.post_likes.find_by(user_id: current_user.id)
  end
end
