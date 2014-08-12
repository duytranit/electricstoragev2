class Invoice < ActiveRecord::Base
	has_many :invoicedetails, dependent: :destroy
	has_many :projects, through: :invoicedetails

	belongs_to :user

	validate :check_from_date?
	validate :check_end_date?

	private
	def check_from_date?
		if self.from_date < Date.today
			errors.add(:from_date, 'is past')
		end
	end

	def check_end_date?
		if self.end_date < self.from_date
			errors.add(:end_date, 'must over From date')
		end
	end
end
