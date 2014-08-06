class Invoice < ActiveRecord::Base
	has_many :invoicedetails

	belongs_to :user
end
