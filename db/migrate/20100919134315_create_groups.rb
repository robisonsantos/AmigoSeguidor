class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string   :name,               :null => false
      t.float    :gift_price,         :null => false
      t.datetime :revelation_day,     :null => false 
      t.string   :revelation_address
      t.string   :revelation_address_link

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
