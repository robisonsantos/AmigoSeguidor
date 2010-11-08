class Group < ActiveRecord::Base
  validates :name, :uniqueness => true
  validates :name, :description, :gift_price, :presence => true  
  validates :gift_price, :numericality => true
  
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships

  has_many :messages

  # Save the group just created and add a new membership
  def save_with_membership(owner)
    status = self.save
    self.memberships.create(:user_id => owner.id,
                             :group_id => id, 
                             :owner => true,
                             :membership_status => 1) if status # Approved
    status
  end

  def owner
    User.find(memberships.where(:owner => true).first.user_id)
  end

  def self.search(name)
    if(name)
      where("name like ? AND private = ?", "%#{name}%", false).all
    else 
      []
    end
  end
end
