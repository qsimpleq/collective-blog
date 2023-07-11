# frozen_string_literal: true

def create_posts
  return if Post.any?

  posts = [
    {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      category_id: Category.first.id,
      creator_id: User.first.id
    },
    {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      category_id: Category.last.id,
      creator_id: User.last.id
    }
  ]

  posts.each { Post.create!(_1) }
end

create_posts
