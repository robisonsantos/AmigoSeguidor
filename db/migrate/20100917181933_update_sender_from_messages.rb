class UpdateSenderFromMessages < ActiveRecord::Migration
  def self.up
    remove_column :messages, :sender
    add_column :messages, :sender, :reference
  end

  def self.down
    remove_column :messages, :sender
    add_column :messages, :sender, :integer
  end
end
