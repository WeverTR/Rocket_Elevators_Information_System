require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
<<<<<<< HEAD
=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> 5ec3c32e133ecc89c65e8910835275182c0a14f1
  test "should get index" do
    get home_index_url
    assert_response :success
  end
<<<<<<< HEAD

=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> 8d9194f26fdb195551d73cf5c46bd55cb8491805
=======
>>>>>>> 5ec3c32e133ecc89c65e8910835275182c0a14f1
end
