class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory

	has_many :attachments, dependent: :destroy
	has_many :feedbacks
	has_many :invoicedetails
	has_many :invoices, through: :invoicedetails

	has_attached_file :photo, :styles => { :small => "150x150>", panel: "470x140>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/



	def self.search(search, procategory_id)
	  if search
	  	if procategory_id != ''
	  		self.where(["title LIKE ? and projects.procategory_id = ?", "%#{search}%", procategory_id])
	  	else
	  		self.where(["title LIKE ?", "%#{search}%"])
	  	end	  	
	  else
	    self.all
	  end
	end


end
