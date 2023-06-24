require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    @post_one = posts(:one)
    @comment_one = post_comments(:one)
    @comment_nested = post_comments(:nested)
    @comment_deep_nested = post_comments(:deep_nested)

    sign_in(@user_one)
  end

  test 'should create comment' do
    post post_comments_url(@post_one), params: {
      post_comment: {
        post_id: @comment_one.post_id,
        user_id: @comment_one.user_id,
        content: @comment_one.content
      }
    }

    assert_response :redirect
    assert_redirected_to post_path(@post_one, anchor: "post_comment_#{PostComment.last.id}")
  end
end
