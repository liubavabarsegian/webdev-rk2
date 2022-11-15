# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get pages_input_url
    assert_response :success
  end

  test 'should get result' do
    get pages_result_url
    assert_response :success
  end
end
