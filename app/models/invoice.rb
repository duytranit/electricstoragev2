class Invoice < ActiveRecord::Base
	has_many :invoicedetails, dependent: :destroy
	has_many :projects, through: :invoicedetails

	belongs_to :user
end
