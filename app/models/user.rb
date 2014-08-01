class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :small => "150x150>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def active_for_authentication?
	  super && status
	end

	def is_staff?
		self.role == 'staff'
	end

	def is_customer?
		self.role == 'customer'		
	end
end
