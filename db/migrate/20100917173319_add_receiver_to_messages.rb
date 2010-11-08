class AddReceiverToMessages < ActiveRecord::Migration
  def self.up
    remove_column :messages, :reciever
    add_column :messages, :receiver, :integer
  end

  def self.down
    remove_column :messages, :receiver
    add_column :messages, :reciever, :integer
  end
end
