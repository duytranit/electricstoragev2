class Procategory < ActiveRecord::Base
	belongs_to :user

	has_many :projects
end
