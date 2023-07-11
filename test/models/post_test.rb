# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  likes_count :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  creator_id  :integer
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_creator_id   (creator_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post_one = posts(:one)

    @post_like_one = post_likes(:one)
    @title_valid = 'category'
    @title_too_long = 'a' * 101
    @title_too_short = ''
    @user_one = users(:one)
    @user_two = users(:two)

    @post_data = {
      title: @title_valid,
      body: @post_one.body,
      category_id: @post_one.category_id,
      creator_id: @user_one.id
    }
  end

  test 'valid title' do
    assert_predicate Post.new(@post_data), :valid?
  end

  test 'invalid title' do
    assert_not_predicate Post.new(@post_data.merge(title: @title_too_long)), :valid?
    assert_not_predicate Post.new(@post_data.merge(title: @title_too_short)), :valid?
  end

  test 'valid body' do
    assert_predicate Post.new(@post_data), :valid?
  end

  test 'invalid body' do
    assert_not_predicate Post.new(@post_data.merge(body: @title_too_short)), :valid?
  end

  test "post liked by user" do
    assert @post_one.liked(@user_one)
    assert_not @post_one.liked(@user_two)
  end
end
