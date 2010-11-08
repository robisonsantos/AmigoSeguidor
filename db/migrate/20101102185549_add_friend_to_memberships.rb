class AddFriendToMemberships < ActiveRecord::Migration
  def self.up
    add_column :memberships, :friend, :integer
  end

  def self.down
    remove_column :memberships, :friend
  end
end
