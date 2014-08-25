class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory

	has_many :attachments, dependent: :destroy
	has_many :feedbacks
	has_many :invoicedetails
	has_many :invoices, through: :invoicedetails

	has_attached_file :photo, :styles => { :small => "150x150>", panel: "470x140>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	def self.search(title, description, min_price, max_price, procategory_id)
		title = title.downcase if title
		description = description.downcase if description
		min_price = 0 if (min_price.nil?)||(min_price == '')
		max_price = 999999999 if (max_price.nil?)||(max_price == '')
		if procategory_id != ''
  		self.where(["LOWER(projects.title) LIKE ? and LOWER(projects.description) LIKE ? and projects.procategory_id = ? and projects.price >= ? and projects.price <= ?", "%#{title}%", "%#{description}%", procategory_id, min_price, max_price])
  	else
  		self.where(["LOWER(projects.title) LIKE ? and LOWER(projects.description) LIKE ? and projects.price >= ? and projects.price <= ?", "%#{title}%", "%#{description}%", min_price, max_price])
  	end	
	end

	def find_invoice_of_user(user_id)
		current_user = User.find(user_id)
		return invoice = current_user.invoices.joins(:invoicedetails).where(["invoicedetails.project_id = ? and invoices.status = ? and invoices.download_time > ?", self.id, true, 0]).first
	end


end
