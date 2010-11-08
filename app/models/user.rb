class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # relationships
  
  # relationship Users X Messages
  has_many :sent_msgs,     :foreign_key => "sender", :class_name => 'Message'
  has_many :received_msgs, :foreign_key => "receiver", :class_name => 'Message'

  # relationship Users X Groups
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships 
  
  # relationship Users X Whishlists
  has_many :wishlists
  has_one :membership

  def owns?(group)
    m = memberships.where(:group_id => group.id).first
    m ? m.owner : false
  end

  def admin?(group)
    m = memberships.where(:group_id => group.id).first
    m ? m.adm : false
  end

end
