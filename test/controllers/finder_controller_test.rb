require 'test_helper'

class FinderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finder_index_url
    assert_response :success
  end

  test "should get alphabetized" do
    get finder_alphabetized_url
    assert_response :success
  end

end
