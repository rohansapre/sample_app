require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:rohan)
	end

	test "layout links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", help_path
		get help_path
		assert_template 'static_pages/help'
		assert_select "a[href=?]", about_path
		get about_path
		assert_template 'static_pages/about'
		assert_select "a[href=?]", contact_path
		get contact_path
		assert_template 'static_pages/contact'
		get root_path
		assert_select "a[href=?]", signup_path
		log_in_as(@user)
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", help_path
		assert_select "a[href=?]", users_path
		assert_select "a[href=?]", user_path(@user)
		assert_select "a[href=?]", edit_user_path(@user)
		assert_select "a[href=?]", logout_path
	end

end
