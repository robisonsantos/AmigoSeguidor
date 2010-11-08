class Message < ActiveRecord::Base
  belongs_to :sender,   :foreign_key => "sender", :class_name => "User"
  belongs_to :receiver, :foreign_key => "receiver", :class_name => "User"
  belongs_to :group
end
