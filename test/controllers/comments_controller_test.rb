require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    @post = posts(:one)
    @comment = post_comments(:with_comments)

    sign_in(@user_one)
  end

  test 'should create comment' do
    pp post post_comments_url(@post), params: { post_comment: {
      post_id: @post.id,
      user_id: @user_one,
      content: @comment.content,
    } }

    assert_response :success
  end

end
