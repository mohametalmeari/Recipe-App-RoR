require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get recipes_index_url
    assert_response :success
  end

  test 'should get new' do
    get recipes_new_url
    assert_response :success
  end
end
