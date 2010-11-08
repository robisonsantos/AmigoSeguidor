class AddRecieverToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :reciever, :integer
  end

  def self.down
    remove_column :messages, :sender
  end
end
