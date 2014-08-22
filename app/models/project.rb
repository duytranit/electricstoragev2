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
		min_price = 0 if min_price == ''
		max_price = 999999999 if max_price == ''
		if procategory_id != ''
  		self.where(["projects.title LIKE ? and projects.description LIKE ? and projects.procategory_id = ? and projects.price >= ? and projects.price <= ?", "%#{title}%", "%#{description}%", procategory_id, min_price, max_price])
  	else
  		self.where(["projects.title LIKE ? and projects.description LIKE ? and projects.price >= ? and projects.price <= ?", "%#{title}%", "%#{description}%", min_price, max_price])
  	end	
	end


end
