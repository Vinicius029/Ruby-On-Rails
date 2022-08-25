require 'test_helper'

class ViniciusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vinicius_index_url
    assert_response :success
  end

end
