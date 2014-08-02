class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory


	has_many :attachments, dependent: :destroy
end
