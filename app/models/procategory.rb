class Procategory < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory

	has_many :projects
	has_many :procategories
end
