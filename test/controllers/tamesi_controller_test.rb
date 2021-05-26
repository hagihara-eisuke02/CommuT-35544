require 'test_helper'

class TamesiControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tamesi_index_url
    assert_response :success
  end
end
