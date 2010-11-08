class AddSenderToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :sender, :integer
  end

  def self.down
    remove_column :messages, :sender
  end
end
