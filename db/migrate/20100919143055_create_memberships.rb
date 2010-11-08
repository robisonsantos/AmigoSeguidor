class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :user_id , :null => false
      t.integer :group_id, :null => false
      t.boolean :adm, :null => false, :default => false
      t.boolean :owner, :null => false, :default => false
      t.integer :membership_status, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
