# frozen_string_literal: true

def create_likes
  return if PostLike.any?

  post = Post.last

  likes = [
    {
      post_id: post.id,
      user_id: User.first.id
    },
    {
      post_id: post.id,
      user_id: User.last.id
    }
  ]

  likes.each { PostLike.create!(_1) }
end

create_likes
