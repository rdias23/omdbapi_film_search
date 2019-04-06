require 'test_helper'

class MovieCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get movie_comments_edit_url
    assert_response :success
  end

end
