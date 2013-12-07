require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a freindship works without reasing an exception" do
		assert_nothing_raised do 
			UserFriendship.create user: users(:chad), friend: users(:justin)
		end	
	end

	test "that creating a freindship based on user id and friend id works" do
		UserFriendship.create user_id: users(:chad).id, friend_id: users(:justin).id
		assert users(:chad).friends.include?(users(:justin))
	end

end
