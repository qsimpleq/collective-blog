# frozen_string_literal: true

def create_comments
  return if PostComment.any?

  post_id = Post.last.id
  user1 = User.first.id
  user2 = User.last.id

  PostComment.create!(
    content: Faker::Lorem.sentence,
    post_id:,
    user_id: user1
  )

  PostComment.create!(
    content: Faker::Lorem.sentence,
    post_id:,
    user_id: user2
  )

  PostComment.create!(
    ancestry: PostComment.last.child_ancestry,
    content: Faker::Lorem.sentence,
    post_id:,
    user_id: user1
  )

  PostComment.create!(
    ancestry: PostComment.last.child_ancestry,
    content: Faker::Lorem.sentence,
    post_id:,
    user_id: user2
  )
end

create_comments
