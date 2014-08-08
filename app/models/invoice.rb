class Invoice < ActiveRecord::Base
	has_many :invoicedetails
	has_many :projects, through: :invoicedetails

	belongs_to :user
end
