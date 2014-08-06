class Invoicedetail < ActiveRecord::Base
	belongs_to :project
	belongs_to :invoice
end
