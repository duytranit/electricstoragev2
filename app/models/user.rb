class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :procategories
  has_many :feedbacks
  has_many :invoices

  has_attached_file :avatar, :styles => { :small => "150x150>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :last_name, presence: true

  before_destroy :check_before_delete

  def active_for_authentication?
	  super && status
	end

	def is_staff?
		self.role == 'staff'
	end

	def is_customer?
		self.role == 'customer'		
	end

  def have_any_relationship
    if self.projects.count > 0
      errors.add(:base, "User created Project")
      return true
    elsif self.procategories.count > 0
      errors.add(:base, "User created Project Category")
      return true
    elsif self.feedbacks.count > 0
      errors.add(:base, "User sent Feedback")
      return true
    elsif self.invoices.count > 0
      errors.add(:base, "User bouhgt Project")
      return true
    else
      return false                  
    end
  end

  def check_before_delete
    if self.projects.count > 0
      errors.add(:base, "User created Project")
      return false
    elsif self.procategories.count > 0
      errors.add(:base, "User created Project Category")
      return false
    elsif self.feedbacks.count > 0
      errors.add(:base, "User sent Feedback")
      return false
    elsif self.invoices.count > 0
      errors.add(:base, "User bouhgt Project")
      return false      
    end
  end
end
