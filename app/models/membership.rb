class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :friend, :foreign_key => 'friend', :class_name => 'User'
end
