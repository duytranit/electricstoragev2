class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory

	has_many :attachments, dependent: :destroy
	has_many :feedbacks
	has_many :invoicedetails

	has_attached_file :photo, :styles => { :small => "150x150>", panel: "470x140>" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/



	def self.search(search)
	  if search
	  	self.where(["title LIKE ?", "%#{search}%"])
	  else
	    self.all
	  end
	end


end
