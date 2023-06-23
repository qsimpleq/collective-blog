require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    @user_two = users(:two)
    @post_one = posts(:one)
    @post_two = posts(:two)
    @post_like_one = post_likes(:one)
    sign_in(@user_one)
  end

  test 'should get create' do
    post post_likes_url(@post_two.id), params: {
      post_id: @post_two.id,
      user_id: @user_one.id
    }

    assert_response :redirect
  end

  test 'should get destroy' do
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post_one.id, @post_like_one.id)
    end

    assert_response :redirect
  end

end
