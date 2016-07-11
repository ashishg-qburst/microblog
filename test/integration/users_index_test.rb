require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "index including pagination" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    User.page(1).per(10).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
end
