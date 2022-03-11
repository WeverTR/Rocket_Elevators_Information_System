require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get home_index_url
    assert_response :success
<<<<<<< HEAD
  end
=======
  end
>>>>>>> ffd0bc07b7cee987d7d03f111a6efd48ea396d65
