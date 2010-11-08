class CreatePrivatecodes < ActiveRecord::Migration
  def self.up
    create_table :privatecodes do |t|
      t.integer :group_id, :null => false
      t.string :code,        :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :privatecodes
  end
end
