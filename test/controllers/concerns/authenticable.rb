require 'test_helper'

class MockController
include Authenticable
attr_accessor :request
def def initialize
  mock_request = Struct.new(:headers)
  self.request = mock_request.new(headers: {})
end
end

class AuthenticableTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @authentication = MockController.new
  end

  test 'Should get user from Authentication Token' do
    @authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
    assert_not_nil @authentication.current_user
    assert_equal @user.id, @authenticate.current_user.id
  end

  test 'Should not get user from empty Authentication Token' do
    @authentication.request.headers['Authorization'] = nil
    assert_nil @authentication.current_user
  end

end