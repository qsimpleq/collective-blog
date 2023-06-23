require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_one = posts(:one)
    get '/users/sign_in'
    sign_in(users(:one))
  end

  test 'should get index' do
    get posts_url

    assert_response :success
  end

  test 'should get new' do
    get new_post_url(Post.new)

    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url,
           params: { post: { body: @post_one.body, category_id: @post_one.category_id, creator_id: @post_one.creator_id,
                             title: @post_one.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post_one)

    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post_one)

    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post_one),
          params: { post: { body: @post_one.body, category_id: @post_one.category_id, creator_id: @post_one.creator_id,
                            title: @post_one.title } }

    assert_redirected_to post_url(@post_one)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post_one)
    end

    assert_redirected_to posts_url
  end
end
